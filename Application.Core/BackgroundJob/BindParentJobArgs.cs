namespace Application.BackgroundJob
{
    public class BindParentJobArgs
    {
        public long SourceUserId { get; set; }
        public long ParentUserId { get; set; }
    }
}
