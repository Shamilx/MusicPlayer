namespace MusicPlayer.MVVM.Model
{
    public class Song
    {
        public string Title { get; set; }
        public string Path { get; set; }

        public override string ToString()
        {
            return Title;
        }
    }
}