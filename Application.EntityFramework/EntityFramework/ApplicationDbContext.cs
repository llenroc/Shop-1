using Application.AgentOrders.Entities;
using Application.AreaAgents;
using Application.AreaAgents.AreaAgencyApplys;
using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Articles;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgencyApplys.Orders.Entities;
using Application.Channel.ChannelAgents;
using Application.CustomerInfos;
using Application.Customers;
using Application.Distributions;
using Application.Expresses;
using Application.Files;
using Application.GlobalRebates;
using Application.Members;
using Application.Members.MemberCardPackageApplys.Orders.Entities;
using Application.MultiTenancy;
using Application.Orders.Entities;
using Application.PictureTemplates;
using Application.ProductCategorys;
using Application.Products;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Application.Regions;
using Application.Scores;
using Application.Scores.Orders.Entities;
using Application.ShopCarts;
using Application.Shops.ShopTemplates;
using Application.Spread.Shares;
using Application.Spread.SpreadPosters.SpreadPosterTemplates;
using Application.VirtualProducts;
using Application.Wallets.Entities;
using Application.Wechats;
using Application.Wechats.AutoReplys;
using Application.Wechats.Qrcodes;
using Infrastructure.CommonFrame.EntityFramework;
using System.Data.Common;
using System.Data.Entity;

namespace Application.EntityFramework
{
    public class ApplicationDbContext: CommonFrameDbContext<Tenant, Role, User>
    {
        public virtual IDbSet<UserDetail> UserDetails { get; set; }

        public virtual IDbSet<WechatUserInfo> WechatUserInfos { get; set; }

        public virtual IDbSet<Article> Articles { get; set; }

        public virtual IDbSet<ArticleLike> ArticleLikes { get; set; }

        public virtual IDbSet<ArticleHint> ArticleHints { get; set; }

        public virtual IDbSet<VirtualCard> VirtualCards { get; set; }

        public virtual IDbSet<OrderItemVirtualCard> OrderItemVirtualCards { get; set; }

        public virtual IDbSet<InfrastructureFileInfo> InfrastructureFileInfos { get; set; }

        public virtual IDbSet<Qrcode> Qrcodes { get; set; }

        public virtual IDbSet<SpreadPosterTemplate> SpreadPosterTemplates { get; set; }

        public virtual IDbSet<TemplateParameter> TemplateParameters { get; set; }

        public virtual IDbSet<AutoReply> AutoReplys { get; set; }

        public virtual IDbSet<AutoReplyArticle> AutoReplyArticles { get; set; }

        public virtual IDbSet<Share> Shares { get; set; }

        public virtual IDbSet<ShareAccess> ShareAccesses { get; set; }

        public virtual IDbSet<Score> Scores { get; set; }

        public virtual IDbSet<ScoreRecord> ScoreRecords { get; set; }

        public virtual IDbSet<ScoreExchangeOrder> ScoreExchangeOrders { get; set; }

        public virtual IDbSet<MemberLevel> MemberLevels { get; set; }

        public virtual IDbSet<MemberCard> MemberCards { get; set; }

        public virtual IDbSet<ProductCategory> ProductCategorys { get; set; }

        public virtual IDbSet<ProductUnit> ProductUnits { get; set; }

        public virtual IDbSet<Product> Products { get; set; }

        public virtual IDbSet<ShopTemplate> ShopTemplates { get; set; }

        public virtual IDbSet<PictureTemplate> PictureTemplates { get; set; }

        public virtual IDbSet<ProductProperty> ProductProperties { get; set; }

        public virtual IDbSet<CustomCustomerInfo> CustomCustomerInfos { get; set; }

        public virtual IDbSet<Distribution> Distributions { get; set; }

        public virtual IDbSet<OrderDistribution> OrderDistributions { get; set; }

        public virtual IDbSet<ChannelAgentProductDistribution> ChannelAgentProductDistributions { get; set; }

        public virtual IDbSet<OrderChannelAgentProductDistribution> OrderChannelAgentProductDistributions { get; set; }

        public virtual IDbSet<ChannelAgentRebate> ChannelAgentRebates { get; set; }

        public virtual IDbSet<SpecificationProperty> SpecificationPropertys { get; set; }

        public virtual IDbSet<SpecificationPropertyValue> SpecificationPropertyValues { get; set; }

        public virtual IDbSet<Specification> Specifications { get; set; }

        public virtual IDbSet<Address> Addresss { get; set; }

        public virtual IDbSet<CustomerInfo> CustomerInfos { get; set; }

        public virtual IDbSet<Order> Orders { get; set; }

        public virtual IDbSet<ProductComment> ProductComments { get; set; }

        public virtual IDbSet<ProductOrder> ProductOrders { get; set; }

        public virtual IDbSet<OrderItem> OrderItems { get; set; }

        public virtual IDbSet<OrderCustomerInfo> OrderCustomerInfos { get; set; }

        public virtual IDbSet<ShopCart> ShopCarts { get; set; }

        public virtual IDbSet<ExpressCompany> ExpressCompanys { get; set; }

        public virtual IDbSet<FreightTemplate> FreightTemplates { get; set; }

        public virtual IDbSet<DeliveryArea> DeliveryAreas { get; set; }

        public virtual IDbSet<ShopCartItem> ShopCartItems { get; set; }

        public virtual IDbSet<MemberCardPackage> MemberCardPackages { get; set; }

        public virtual IDbSet<MemberCardPackageOrder> MemberCardPackageOrders { get; set; }

        public virtual IDbSet<Wallet> Wallets { get; set; }

        public virtual IDbSet<WalletRecord> WalletRecords { get; set; }
        public virtual IDbSet<WithdrawApply> WithdrawApplys { get; set; }

        public virtual IDbSet<ChannelAgent> ChannelAgents { get; set; }

        public virtual IDbSet<Channel.ChannelAgents.ChannelAgentDistribution> ChannelAgentDistributions { get; set; }
        
        public virtual IDbSet<OrderChannelAgentDistribution> OrderChannelAgentDistributions { get; set; }

        public virtual IDbSet<ChannelAgentAssortment> ChannelAgentAssortments { get; set; }

        public virtual IDbSet<ChannelAgency> ChannelAgencies { get; set; }

        public virtual IDbSet<ChannelAgencyApply> ChannelAgencyApplys { get; set; }

        public virtual IDbSet<ChannelAgencyApplyOrder> ChannelAgencyApplyOrders { get; set; }

        public virtual IDbSet<AgentOrder> AgentOrders { get; set; }

        public virtual IDbSet<AreaAgent> AreaAgents { get; set; }

        public virtual IDbSet<AreaAgentDistribution> AreaAgentDistributions { get; set; }

        public virtual IDbSet<OrderAreaAgentDistribution> OrderAreaAgentDistributions { get; set; }

        public virtual IDbSet<AreaAgency> AreaAgencys { get; set; }

        public virtual IDbSet<AreaAgencyApply> AreaAgencyApplys { get; set; }

        public virtual IDbSet<AreaAgencyApplyAddress> AreaAgencyApplyAddresses { get; set; }

        public virtual IDbSet<AreaAgencyArea> AreaAgencyAreas { get; set; }

        public virtual IDbSet<AreaAgentRebate> AreaAgentRebates { get; set; }

        public virtual IDbSet<GlobalRebate> GlobalRebates { get; set; }

        public virtual IDbSet<OrderGlobalRebate> OrderGlobalRebates { get; set; }
        
        public virtual IDbSet<AreaAgencyApplyOrder> AreaAgencyApplyOrders { get; set; }


        static ApplicationDbContext()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<ApplicationDbContext, Application.Migrations.Configuration>());
            //Database.SetInitializer(new DatabaseInitializerForCreateDatabaseIfNotExists());
        }

        public ApplicationDbContext(): base("Default")
        {

        }

        public ApplicationDbContext(string nameOrConnectionString): base(nameOrConnectionString)
        {

        }

        //This constructor is used in tests
        public ApplicationDbContext(DbConnection connection) : base(connection, true)
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<OrderCustomerInfo>()
                .HasRequired(OrderCustomerInfo => OrderCustomerInfo.Order)
                .WithOptional(model => model.OrderCustomerInfo);

            modelBuilder.Entity<User>().HasOptional(user => user.WechatUserInfo).WithRequired(wechatUserInfo => wechatUserInfo.User);
            modelBuilder.Entity<User>().HasOptional(user => user.UserDetail).WithRequired(userDetail => userDetail.User); 
            modelBuilder.Entity<AreaAgency>().HasMany(t => t.AreaAgencyAreas).WithRequired(p => p.AreaAgency).WillCascadeOnDelete(false);

            modelBuilder.Entity<WalletRecord>().HasOptional(t => t.WithdrawApply).WithRequired(t => t.WalletRecord);
        }
    }
}
