namespace Application.Authorization.End.Users.Dto
{
    public class BindParentInput
    {
        public long SourceUserId { get; set; }
        public long TargetUserId { get; set; }
    }
}
