using Infrastructure.Dependency;

namespace Application
{
    public class AppFolders : IAppFolders, ISingletonDependency
    {
        public string TempFileDownloadFolder { get; set; }

        public string SampleProfileImagesFolder { get; set; }

        public string WebLogsFolder { get; set; }

        public string UserResourceFolderBase { get; set; }

        public string UploadFolder { get; set; }
    }
}
