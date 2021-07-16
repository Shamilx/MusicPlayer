using System.Collections.ObjectModel;
using System.IO;
using System.Windows.Input;
using MusicPlayer.MVVM.Commands;
using MusicPlayer.MVVM.Model;
using System.Text.Json;
using System.Windows;
using System.Windows.Documents;
using MaterialDesignThemes.Wpf;
using Microsoft.Win32;
using WMPLib;

namespace MusicPlayer.MVVM.ViewModel
{
    public class PlayerVm
    {
        public ICommand ManageMusicsCommand { get; set; }
        public ICommand AddMusicCommand { get; set; }
        public ICommand DeleteMusicCommand { get; set; }
        public ICommand PlayButtonCommand { get; set; }
        public ICommand PlaySelectedMusicCommand { get; set; }
        public ICommand OnClosingCommand { get; set; }
        public ICommand ForwardButtonCommand { get; set; }
        public ICommand BackButtonCommand { get; set; }
        public Song SelectedMusicItem { get; set; }
        public PackIcon PlayButtonContent { get; set; }
        public ObservableCollection<Song> SongList { get; set; }
        public WindowsMediaPlayer Player { get; set; }
        public Song CurrentSong { get; set; }
        
        public PlayerVm()
        {
            CheckForFiles();

            ManageMusicsCommand = ManageMusics();
            AddMusicCommand = AddMusic();
            DeleteMusicCommand = DeleteMusic();
            PlaySelectedMusicCommand = PlaySelectedMusic();
            PlayButtonCommand = PlayButton();
            ForwardButtonCommand = ForwardButton();
            BackButtonCommand = BackButton();
            OnClosingCommand = new RelayCommand(_ => OnPlayerClosed(), _ => true);
            SongList = GetSongList();
            PlayButtonContent = new PackIcon();

            PlayButtonContent.Kind = PackIconKind.Play;
        }
        
        public void OnPlayerClosed()
        {
            string path = @"C:\Songs.txt";

            var x = JsonSerializer.Serialize(SongList);

            using (StreamWriter writer = new StreamWriter(path))
            {
                writer.Write(x);
            }
        }
        
        private RelayCommand BackButton()
        {
            return new RelayCommand(_ =>
            {
                if (CurrentSong != null && Player != null && SongList.Count > 0)
                {
                    int index = SongList.IndexOf(CurrentSong);

                    Player.controls.stop();

                    if (index - 1 < 0)
                    {
                        index = SongList.Count - 1;
                    }
                    else
                    {
                        index = index - 1;
                    }

                    Player = new WindowsMediaPlayerClass();
                    Player.PlayStateChange += Player_PlayStateChange;
                    Player.URL = SongList[index].Path;
                    Player.controls.play();

                    CurrentSong = SongList[index];
                    PlayButtonContent.Kind = PackIconKind.Pause;
                }
            }, _ => true);
        }

        private RelayCommand ForwardButton()
        {
            return new RelayCommand(_ =>
            {
                if (CurrentSong != null && Player != null && SongList.Count > 0)
                {
                    int index = SongList.IndexOf(CurrentSong);

                    Player.controls.stop();

                    if (index + 1 >= SongList.Count)
                    {
                        index = 0;
                    }
                    else
                    {
                        index = index + 1;
                    }

                    Player = new WindowsMediaPlayerClass();
                    Player.PlayStateChange += Player_PlayStateChange;
                    Player.URL = SongList[index].Path;
                    Player.controls.play();

                    CurrentSong = SongList[index];
                    PlayButtonContent.Kind = PackIconKind.Pause;
                }
            }, _ => true);
        }

        private RelayCommand PlaySelectedMusic()
        {
            return new RelayCommand((_) =>
            {
                if (SelectedMusicItem != null)
                {
                    Player?.controls.stop();
                    
                    CurrentSong = SelectedMusicItem;
                    
                    Player = new WindowsMediaPlayerClass();
                    Player.PlayStateChange += Player_PlayStateChange;
                    Player.URL = CurrentSong.Path;
                    Player.controls.play();
                    PlayButtonContent.Kind = PackIconKind.Pause;
                }
            }, (_) => true);
        }

        private RelayCommand PlayButton()
        {
            return new RelayCommand((_) =>
            {
                if (PlayButtonContent.Kind == PackIconKind.Play)
                {
                    if (!(SongList.Count == 0))
                    {
                        if (CurrentSong == null)
                        {
                            if (Player == null)
                            {
                                Player = new WindowsMediaPlayerClass();
                                Player.PlayStateChange += Player_PlayStateChange;
                                Player.URL = SongList[0].Path;

                                CurrentSong = SongList[0];
                            }

                            Player.controls.play();
                            PlayButtonContent.Kind = PackIconKind.Pause;
                        }
                        else
                        {
                            Player?.controls.play();
                            PlayButtonContent.Kind = PackIconKind.Pause;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Add song first!");
                    }
                }
                else if (PlayButtonContent.Kind == PackIconKind.Pause)
                {
                    Player?.controls.pause();
                    PlayButtonContent.Kind = PackIconKind.Play;
                }
            }, (_) => true);
        }

        private void Player_PlayStateChange(int newstate)
        {
            if ((WMPPlayState) newstate == WMPPlayState.wmppsStopped)
            {
                PlayButtonContent.Kind = PackIconKind.Play;
                CurrentSong = null;
            }
        }

        private RelayCommand DeleteMusic()
        {
            return new RelayCommand((_) =>
            {
                if (SelectedMusicItem != null)
                {
                    SongList.Remove(SelectedMusicItem);
                }
                else
                {
                    MessageBox.Show("Select the music from List!");
                }
            }, (_) => true);
        }

        private RelayCommand AddMusic()
        {
            return new RelayCommand((o) =>
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "MP3 | *.mp3;";
                if (openFileDialog.ShowDialog() == true)
                {
                    SongList.Add(CreateSong(openFileDialog.FileName, openFileDialog.SafeFileName));
                }
            }, (o) => true);
        }

        private void CheckForFiles()
        {
            const string path = @"C:\Songs.txt";

            if (!System.IO.File.Exists(path))
            {
                System.IO.File.Create(path);
            }
        }

        private ObservableCollection<Song> GetSongList()
        {
            return GetSongFromFile() ?? new ObservableCollection<Song>();
        }

        private ObservableCollection<Song> GetSongFromFile()
        {
            string[] text = System.IO.File.ReadAllLines(@"C:\Songs.txt");

            if (text.Length == 0)
            {
                return null;
            }

            return JsonSerializer.Deserialize<ObservableCollection<Song>>(string.Join("", text));
        }

        private RelayCommand ManageMusics()
        {
            return new RelayCommand(o =>
            {
                View.MusicListManager obj = new();
                obj.ShowDialog();
            }, o => true);
        }

        private Song CreateSong(string path, string fileName)
        {
            return new Song()
            {
                Title = fileName.Replace(".mp3", ""),
                Path = path,
            };
        }
    }
}