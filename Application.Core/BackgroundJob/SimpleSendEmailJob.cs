using Application.Authorization.Users;
using Infrastructure.BackgroundJobs;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Net.Mail;

namespace Application.BackgroundJob
{
    public class SimpleSendEmailJob : BackgroundJob<SimpleSendEmailJobArgs>, ITransientDependency
    {
        private readonly IRepository<User, long> _userRepository;
        private readonly IEmailSender _emailSender;

        public SimpleSendEmailJob(IRepository<User, long> userRepository, IEmailSender emailSender)
        {
            _userRepository = userRepository;
            _emailSender = emailSender;
        }

        public override void Execute(SimpleSendEmailJobArgs args)
        {
            var senderUser = _userRepository.Get(args.SenderUserId);
            var targetUser = _userRepository.Get(args.TargetUserId);

            _emailSender.Send(senderUser.EmailAddress, targetUser.EmailAddress, args.Subject, args.Body);
        }
    }
}
