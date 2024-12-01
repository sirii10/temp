using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SqlAccessLibrary.SQL;

public partial class IscDatabaseContext : DbContext
{
    public IscDatabaseContext()
    {
    }

    public IscDatabaseContext(DbContextOptions<IscDatabaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AboutPage> AboutPages { get; set; }

    public virtual DbSet<Alias> Aliases { get; set; }

    public virtual DbSet<Article> Articles { get; set; }

    public virtual DbSet<ArticleImage> ArticleImages { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<EventKeyword> EventKeywords { get; set; }

    public virtual DbSet<EventPerformance> EventPerformances { get; set; }

    public virtual DbSet<EventPerformer> EventPerformers { get; set; }

    public virtual DbSet<FeaturedArticle> FeaturedArticles { get; set; }

    public virtual DbSet<FeaturedEvent> FeaturedEvents { get; set; }

    public virtual DbSet<FeaturedPerformer> FeaturedPerformers { get; set; }

    public virtual DbSet<IscAttribute> IscAttributes { get; set; }

    public virtual DbSet<IscDomain> IscDomains { get; set; }

    public virtual DbSet<IscSubject> IscSubjects { get; set; }

    public virtual DbSet<Keyword> Keywords { get; set; }

    public virtual DbSet<Originator> Originators { get; set; }

    public virtual DbSet<Performance> Performances { get; set; }

    public virtual DbSet<PerformanceKeyword> PerformanceKeywords { get; set; }

    public virtual DbSet<PerformancePerformer> PerformancePerformers { get; set; }

    public virtual DbSet<PerformanceRecording> PerformanceRecordings { get; set; }

    public virtual DbSet<Performer> Performers { get; set; }

    public virtual DbSet<PerformerBiography> PerformerBiographies { get; set; }

    public virtual DbSet<PerformerImage> PerformerImages { get; set; }

    public virtual DbSet<PerformerKeyword> PerformerKeywords { get; set; }

    public virtual DbSet<PerformerName> PerformerNames { get; set; }

    public virtual DbSet<ProfileImage> ProfileImages { get; set; }

    public virtual DbSet<RecordingSearch> RecordingSearches { get; set; }

    public virtual DbSet<RoleType> RoleTypes { get; set; }

    public virtual DbSet<TitlePage> TitlePages { get; set; }

    public virtual DbSet<TranscriptionRecording> TranscriptionRecordings { get; set; }

    public virtual DbSet<TranscriptionSrt> TranscriptionSrts { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserAddress> UserAddresses { get; set; }

    public virtual DbSet<UserGender> UserGenders { get; set; }

    public virtual DbSet<UserName> UserNames { get; set; }

    public virtual DbSet<UserPhoneNumber> UserPhoneNumbers { get; set; }

    public virtual DbSet<UserRole> UserRoles { get; set; }
    
    public virtual DbSet<UploadStatus> UploadStatus { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<PerformerSearchResult>().HasNoKey().ToView(null);
        modelBuilder.Entity<PerformanceSearchResult>().HasNoKey().ToView(null);
        modelBuilder.Entity<EventSearchResult>().HasNoKey().ToView(null);
        modelBuilder.Entity<TranscriptionSearchResult>().HasNoKey().ToView(null);
        modelBuilder.Entity<UploadStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("upload_status");

            entity.Property(e => e.Status).HasColumnName("Status");
            entity.Property(e => e.Progress).HasColumnName("Progress");
            entity.Property(e => e.Last_Updated).HasColumnName("Last_Updated");
            entity.Property(e => e.FileName).HasColumnName("FileName");


        });


        modelBuilder.Entity<AboutPage>(entity =>
        {
            entity.HasKey(e => e.AboutPageId).HasName("PRIMARY");

            entity.ToTable("about_page");

            entity.Property(e => e.AboutPageId).HasColumnName("about_page_id");
            entity.Property(e => e.Heading)
                .HasColumnType("tinytext")
                .HasColumnName("heading");
            entity.Property(e => e.Subheading)
                .HasColumnType("text")
                .HasColumnName("subheading");
            entity.Property(e => e.VideoLink)
                .HasColumnType("tinytext")
                .HasColumnName("video_link");
        });

        modelBuilder.Entity<Alias>(entity =>
        {
            entity.HasKey(e => e.AliasId).HasName("PRIMARY");

            entity.ToTable("aliases");

            entity.HasIndex(e => e.AttributeId, "aliases_attribute_id_idx");

            entity.HasIndex(e => e.DomainId, "aliases_domain_id_idx");

            entity.HasIndex(e => e.KeywordId, "alises_keyword_id_idx");

            entity.HasIndex(e => e.SubjectId, "alises_subject_id_idx");

            entity.Property(e => e.AliasId).HasColumnName("alias_id");
            entity.Property(e => e.AttributeId).HasColumnName("attribute_id");
            entity.Property(e => e.DomainId).HasColumnName("domain_id");
            entity.Property(e => e.KeywordId).HasColumnName("keyword_id");
            entity.Property(e => e.Lastsearch)
                .HasColumnType("datetime")
                .HasColumnName("lastsearch");
            entity.Property(e => e.Rank).HasColumnName("rank");
            entity.Property(e => e.Searchcount).HasColumnName("searchcount");
            entity.Property(e => e.SubjectId).HasColumnName("subject_id");

            entity.HasOne(d => d.Attribute).WithMany(p => p.Aliases)
                .HasForeignKey(d => d.AttributeId)
                .HasConstraintName("aliases_attribute_id");

            entity.HasOne(d => d.Domain).WithMany(p => p.Aliases)
                .HasForeignKey(d => d.DomainId)
                .HasConstraintName("aliases_domain_id");

            entity.HasOne(d => d.Keyword).WithMany(p => p.Aliases)
                .HasForeignKey(d => d.KeywordId)
                .HasConstraintName("alises_keyword_id");

            entity.HasOne(d => d.Subject).WithMany(p => p.Aliases)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("alises_subject_id");
        });

        modelBuilder.Entity<Article>(entity =>
        {
            entity.HasKey(e => e.ArticleId).HasName("PRIMARY");

            entity.ToTable("articles");

            entity.HasIndex(e => e.AttributeId, "articles_attribute_id_idx");

            entity.HasIndex(e => e.OriginatorId, "articles_originator_id_idx");

            entity.HasIndex(e => e.SubjectId, "articles_subject_id_idx");

            entity.HasIndex(e => e.UserId, "articles_user_id_idx");

            entity.Property(e => e.ArticleId).HasColumnName("article_id");
            entity.Property(e => e.AttributeId).HasColumnName("attribute_id");
            entity.Property(e => e.OriginatorId).HasColumnName("originator_id");
            entity.Property(e => e.PostContent)
                .HasColumnType("mediumtext")
                .HasColumnName("post_content");
            entity.Property(e => e.PostDate)
                .HasColumnType("datetime")
                .HasColumnName("post_date");
            entity.Property(e => e.PostDateGmt)
                .HasColumnType("datetime")
                .HasColumnName("post_date_gmt");
            entity.Property(e => e.PostExcerpt)
                .HasColumnType("text")
                .HasColumnName("post_excerpt");
            entity.Property(e => e.PostLastModified)
                .HasColumnType("datetime")
                .HasColumnName("post_last_modified");
            entity.Property(e => e.PostName)
                .HasMaxLength(100)
                .HasColumnName("post_name");
            entity.Property(e => e.PostStatus)
                .HasMaxLength(50)
                .HasColumnName("post_status");
            entity.Property(e => e.PostTitle)
                .HasMaxLength(100)
                .HasColumnName("post_title");
            entity.Property(e => e.SubjectId).HasColumnName("subject_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.Attribute).WithMany(p => p.Articles)
                .HasForeignKey(d => d.AttributeId)
                .HasConstraintName("articles_attribute_id");

            entity.HasOne(d => d.Originator).WithMany(p => p.Articles)
                .HasForeignKey(d => d.OriginatorId)
                .HasConstraintName("articles_originator_id");

            entity.HasOne(d => d.Subject).WithMany(p => p.Articles)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("articles_subject_id");

            entity.HasOne(d => d.User).WithMany(p => p.Articles)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("articles_user_id");
        });

        modelBuilder.Entity<ArticleImage>(entity =>
        {
            entity.HasKey(e => e.ArticleImageId).HasName("PRIMARY");

            entity.ToTable("article_images");

            entity.HasIndex(e => e.ArticleId, "article_images_article_id_idx");

            entity.Property(e => e.ArticleImageId).HasColumnName("article_image_id");
            entity.Property(e => e.ArticleId).HasColumnName("article_id");
            entity.Property(e => e.Description)
                .HasMaxLength(200)
                .HasColumnName("description");
            entity.Property(e => e.ImageDir)
                .HasMaxLength(260)
                .HasColumnName("image_dir");
            entity.Property(e => e.ImageName)
                .HasMaxLength(200)
                .HasColumnName("image_name");
            entity.Property(e => e.ImageType)
                .HasMaxLength(45)
                .HasColumnName("image_type");
            entity.Property(e => e.ImageUrl)
                .HasMaxLength(100)
                .HasColumnName("image_url");

            entity.HasOne(d => d.Article).WithMany(p => p.ArticleImages)
                .HasForeignKey(d => d.ArticleId)
                .HasConstraintName("article_images_article_id");
        });

        modelBuilder.Entity<Event>(entity =>
        {
            entity.HasKey(e => e.EventId).HasName("PRIMARY");

            entity.ToTable("events");

            entity.HasIndex(e => new { e.Name, e.Description }, "event_fulltext");

            entity.Property(e => e.EventId).HasColumnName("event_id");
            entity.Property(e => e.Attendance).HasColumnName("attendance");
            entity.Property(e => e.Description)
                .HasColumnType("text")
                .HasColumnName("description");
            entity.Property(e => e.EndDate)
                .HasColumnType("datetime")
                .HasColumnName("end_date");
            entity.Property(e => e.IsPublic)
                .HasColumnType("bit(1)")
                .HasColumnName("is_public");
            entity.Property(e => e.Location)
                .HasMaxLength(250)
                .HasColumnName("location");
            entity.Property(e => e.Name)
                .HasMaxLength(250)
                .HasColumnName("name");
            entity.Property(e => e.ProgramPath)
                .HasMaxLength(250)
                .HasColumnName("program_path");
            entity.Property(e => e.StartDate)
                .HasColumnType("datetime")
                .HasColumnName("start_date");
        });

        modelBuilder.Entity<EventKeyword>(entity =>
        {
            entity.HasKey(e => e.EventKeywordId).HasName("PRIMARY");

            entity.ToTable("event_keywords");

            entity.HasIndex(e => e.EventId, "event_keywords_event_id_idx");

            entity.HasIndex(e => e.KeywordId, "event_keywords_keyword_id_idx");

            entity.Property(e => e.EventKeywordId).HasColumnName("event_keyword_id");
            entity.Property(e => e.EventId).HasColumnName("event_id");
            entity.Property(e => e.KeywordId).HasColumnName("keyword_id");

            entity.HasOne(d => d.Event).WithMany(p => p.EventKeywords)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("event_keywords_event_id");

            entity.HasOne(d => d.Keyword).WithMany(p => p.EventKeywords)
                .HasForeignKey(d => d.KeywordId)
                .HasConstraintName("event_keywords_keyword_id");
        });

        modelBuilder.Entity<EventPerformance>(entity =>
        {
            entity.HasKey(e => e.EventPerformanceId).HasName("PRIMARY");

            entity.ToTable("event_performances");

            entity.HasIndex(e => e.EventId, "event_performances_event_id_idx");

            entity.HasIndex(e => e.PerformanceId, "event_performances_performance_id_idx");

            entity.Property(e => e.EventPerformanceId).HasColumnName("event_performance_id");
            entity.Property(e => e.EventId).HasColumnName("event_id");
            entity.Property(e => e.PerformanceId).HasColumnName("performance_id");

            entity.HasOne(d => d.Event).WithMany(p => p.EventPerformances)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("event_performances_event_id");

            entity.HasOne(d => d.Performance).WithMany(p => p.EventPerformances)
                .HasForeignKey(d => d.PerformanceId)
                .HasConstraintName("event_performances_performance_id");
        });

        modelBuilder.Entity<EventPerformer>(entity =>
        {
            entity.HasKey(e => e.EventPerformerId).HasName("PRIMARY");

            entity.ToTable("event_performers");

            entity.HasIndex(e => e.EventId, "event_performers_event_id_idx");

            entity.HasIndex(e => e.PerformerId, "event_performers_performer_id_idx");

            entity.Property(e => e.EventPerformerId).HasColumnName("event_performer_id");
            entity.Property(e => e.EventId).HasColumnName("event_id");
            entity.Property(e => e.PerformerId).HasColumnName("performer_id");

            entity.HasOne(d => d.Event).WithMany(p => p.EventPerformers)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("event_performers_event_id");

            entity.HasOne(d => d.Performer).WithMany(p => p.EventPerformers)
                .HasForeignKey(d => d.PerformerId)
                .HasConstraintName("event_performers_performer_id");
        });

        modelBuilder.Entity<FeaturedArticle>(entity =>
        {
            entity.HasKey(e => e.FeaturedArticleId).HasName("PRIMARY");

            entity.ToTable("featured_articles");

            entity.HasIndex(e => e.AboutPageId, "featured_article_about_page_id_idx");

            entity.HasIndex(e => e.ArticleId, "featured_article_article_id_idx");

            entity.Property(e => e.FeaturedArticleId).HasColumnName("featured_article_id");
            entity.Property(e => e.AboutPageId).HasColumnName("about_page_id");
            entity.Property(e => e.ArticleId).HasColumnName("article_id");

            entity.HasOne(d => d.AboutPage).WithMany(p => p.FeaturedArticles)
                .HasForeignKey(d => d.AboutPageId)
                .HasConstraintName("featured_article_about_page_id");

            entity.HasOne(d => d.Article).WithMany(p => p.FeaturedArticles)
                .HasForeignKey(d => d.ArticleId)
                .HasConstraintName("featured_article_article_id");
        });

        modelBuilder.Entity<FeaturedEvent>(entity =>
        {
            entity.HasKey(e => e.FeaturedEventId).HasName("PRIMARY");

            entity.ToTable("featured_event");

            entity.HasIndex(e => e.EventId, "featured_event_event_id_idx");

            entity.HasIndex(e => e.TitlePageId, "featured_event_title_page_id_idx");

            entity.Property(e => e.FeaturedEventId).HasColumnName("featured_event_id");
            entity.Property(e => e.ArticleLink)
                .HasMaxLength(100)
                .HasColumnName("article_link");
            entity.Property(e => e.EventId).HasColumnName("event_id");
            entity.Property(e => e.TitlePageId).HasColumnName("title_page_id");

            entity.HasOne(d => d.Event).WithMany(p => p.FeaturedEvents)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("featured_event_event_id");

            entity.HasOne(d => d.TitlePage).WithMany(p => p.FeaturedEvents)
                .HasForeignKey(d => d.TitlePageId)
                .HasConstraintName("featured_event_title_page_id");
        });

        modelBuilder.Entity<FeaturedPerformer>(entity =>
        {
            entity.HasKey(e => e.FeaturedPerformerId).HasName("PRIMARY");

            entity.ToTable("featured_performer");

            entity.HasIndex(e => e.TitlePageId, "featured_performer_title_page_id_idx");

            entity.Property(e => e.FeaturedPerformerId).HasColumnName("featured_performer_id");
            entity.Property(e => e.FeaturedPerformerImagePath)
                .HasMaxLength(260)
                .HasColumnName("featured_performer_image_path");
            entity.Property(e => e.PerformerName)
                .HasMaxLength(100)
                .HasColumnName("performer_name");
            entity.Property(e => e.TitlePageId).HasColumnName("title_page_id");

            entity.HasOne(d => d.TitlePage).WithMany(p => p.FeaturedPerformers)
                .HasForeignKey(d => d.TitlePageId)
                .HasConstraintName("featured_performer_title_page_id");
        });

        modelBuilder.Entity<IscAttribute>(entity =>
        {
            entity.HasKey(e => e.AttributeId).HasName("PRIMARY");

            entity.ToTable("isc_attributes");

            entity.Property(e => e.AttributeId).HasColumnName("attribute_id");
            entity.Property(e => e.Term)
                .HasMaxLength(50)
                .HasColumnName("term");
        });

        modelBuilder.Entity<IscDomain>(entity =>
        {
            entity.HasKey(e => e.DomainId).HasName("PRIMARY");

            entity.ToTable("isc_domains");

            entity.Property(e => e.DomainId).HasColumnName("domain_id");
            entity.Property(e => e.Term)
                .HasMaxLength(50)
                .HasColumnName("term");
        });

        modelBuilder.Entity<IscSubject>(entity =>
        {
            entity.HasKey(e => e.SubjectId).HasName("PRIMARY");

            entity.ToTable("isc_subjects");

            entity.Property(e => e.SubjectId).HasColumnName("subject_id");
            entity.Property(e => e.Term)
                .HasMaxLength(50)
                .HasColumnName("term");
        });

        modelBuilder.Entity<Keyword>(entity =>
        {
            entity.HasKey(e => e.KeywordId).HasName("PRIMARY");

            entity.ToTable("keywords");

            entity.Property(e => e.KeywordId).HasColumnName("keyword_id");
            entity.Property(e => e.Keyword1)
                .HasMaxLength(50)
                .HasColumnName("keyword");
            entity.Property(e => e.KeywordType)
                .HasMaxLength(50)
                .HasColumnName("keyword_type");
        });

        modelBuilder.Entity<Originator>(entity =>
        {
            entity.HasKey(e => e.OriginatorId).HasName("PRIMARY");

            entity.ToTable("originators");

            entity.HasIndex(e => e.AttributeId, "originator_attribute_id_idx");

            entity.HasIndex(e => e.DomainId, "originators_domain_id_idx");

            entity.HasIndex(e => e.UserId, "originators_user_id_idx");

            entity.Property(e => e.OriginatorId).HasColumnName("originator_id");
            entity.Property(e => e.AttributeId).HasColumnName("attribute_id");
            entity.Property(e => e.DomainId).HasColumnName("domain_id");
            entity.Property(e => e.OriginatorType)
                .HasMaxLength(50)
                .HasColumnName("originator_type");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.Attribute).WithMany(p => p.Originators)
                .HasForeignKey(d => d.AttributeId)
                .HasConstraintName("originator_attribute_id");

            entity.HasOne(d => d.Domain).WithMany(p => p.Originators)
                .HasForeignKey(d => d.DomainId)
                .HasConstraintName("originators_domain_id");

            entity.HasOne(d => d.User).WithMany(p => p.Originators)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("originators_user_id");
        });

        modelBuilder.Entity<Performance>(entity =>
        {
            entity.HasKey(e => e.PerformanceId).HasName("PRIMARY");

            entity.ToTable("performances");

            entity.HasIndex(e => e.Name, "performanceName_fulltext");

            entity.Property(e => e.PerformanceId).HasColumnName("performance_id");
            entity.Property(e => e.Attendance).HasColumnName("attendance");
            entity.Property(e => e.Description)
                .HasColumnType("text")
                .HasColumnName("description");
            entity.Property(e => e.EndDate)
                .HasColumnType("date")
                .HasColumnName("end_date");
            entity.Property(e => e.EndTime)
                .HasColumnType("datetime")
                .HasColumnName("end_time");
            entity.Property(e => e.HasAdultContent).HasColumnName("has_adult_content");
            entity.Property(e => e.IsPublic).HasColumnName("is_public");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .HasColumnName("name");
            entity.Property(e => e.Performancescol)
                .HasMaxLength(45)
                .HasColumnName("performancescol");
            entity.Property(e => e.StartDate)
                .HasColumnType("date")
                .HasColumnName("start_date");
            entity.Property(e => e.StartTime)
                .HasColumnType("datetime")
                .HasColumnName("start_time");
        });

        modelBuilder.Entity<PerformanceKeyword>(entity =>
        {
            entity.HasKey(e => e.PerformanceKeywordId).HasName("PRIMARY");

            entity.ToTable("performance_keywords");

            entity.HasIndex(e => e.KeywordId, "performance_keywords_keyword_id_idx");

            entity.HasIndex(e => e.PerformanceId, "performance_keywords_performance_id_idx");

            entity.Property(e => e.PerformanceKeywordId).HasColumnName("performance_keyword_id");
            entity.Property(e => e.KeywordId).HasColumnName("keyword_id");
            entity.Property(e => e.PerformanceId).HasColumnName("performance_id");

            entity.HasOne(d => d.Keyword).WithMany(p => p.PerformanceKeywords)
                .HasForeignKey(d => d.KeywordId)
                .HasConstraintName("performance_keywords_keyword_id");

            entity.HasOne(d => d.Performance).WithMany(p => p.PerformanceKeywords)
                .HasForeignKey(d => d.PerformanceId)
                .HasConstraintName("performance_keywords_performance_id");
        });

        modelBuilder.Entity<PerformancePerformer>(entity =>
        {
            entity.HasKey(e => e.PerformancePerformerId).HasName("PRIMARY");

            entity.ToTable("performance_performers");

            entity.HasIndex(e => e.PerformanceId, "performance_performer_performance_id_idx");

            entity.HasIndex(e => e.PerformerId, "performance_performers_performer_id_idx");

            entity.Property(e => e.PerformancePerformerId).HasColumnName("performance_performer_id");
            entity.Property(e => e.PerformanceId).HasColumnName("performance_id");
            entity.Property(e => e.PerformerId).HasColumnName("performer_id");

            entity.HasOne(d => d.Performance).WithMany(p => p.PerformancePerformers)
                .HasForeignKey(d => d.PerformanceId)
                .HasConstraintName("performance_performer_performance_id");

            entity.HasOne(d => d.Performer).WithMany(p => p.PerformancePerformers)
                .HasForeignKey(d => d.PerformerId)
                .HasConstraintName("performance_performers_performer_id");
        });

        modelBuilder.Entity<PerformanceRecording>(entity =>
        {
            entity.HasKey(e => e.PerformanceRecordingId).HasName("PRIMARY");

            entity.ToTable("performance_recording");

            entity.HasIndex(e => e.PerformanceId, "performance_recording_performance_id_idx");

            entity.Property(e => e.PerformanceRecordingId).HasColumnName("performance_recording_id");
            entity.Property(e => e.AudioOrVideo)
                .HasMaxLength(45)
                .HasColumnName("audio_or_video");
            entity.Property(e => e.Format)
                .HasMaxLength(50)
                .HasColumnName("format");
            entity.Property(e => e.PerformanceId).HasColumnName("performance_id");
            entity.Property(e => e.PermissionToRelease).HasColumnName("permission_to_release");
            entity.Property(e => e.PlayCount).HasColumnName("play_count");
            entity.Property(e => e.ReadyForRelease).HasColumnName("ready_for_release");
            entity.Property(e => e.RecordingName)
                .HasMaxLength(260)
                .HasColumnName("recording_name");
            entity.Property(e => e.RecordingPath)
                .HasMaxLength(260)
                .HasColumnName("recording_path");
            entity.Property(e => e.Runtime)
                .HasColumnType("time")
                .HasColumnName("runtime");
            entity.Property(e => e.SequenceNumber).HasColumnName("sequence_number");

            entity.HasOne(d => d.Performance).WithMany(p => p.PerformanceRecordings)
                .HasForeignKey(d => d.PerformanceId)
                .HasConstraintName("performance_recording_performance_id");
        });

        modelBuilder.Entity<Performer>(entity =>
        {
            entity.HasKey(e => e.PerformerId).HasName("PRIMARY");

            entity.ToTable("performers");

            entity.Property(e => e.PerformerId).HasColumnName("performer_id");
        });

        modelBuilder.Entity<PerformerBiography>(entity =>
        {
            entity.HasKey(e => e.PerformerBiographyId).HasName("PRIMARY");

            entity.ToTable("performer_biographies");

            entity.HasIndex(e => e.Biography, "biographies_fullTextIndex");

            entity.HasIndex(e => e.EventId, "performer_biographies_event_id_idx");

            entity.HasIndex(e => e.PerformerId, "performer_biogrpahies_performer_id_idx");

            entity.Property(e => e.PerformerBiographyId).HasColumnName("performer_biography_id");
            entity.Property(e => e.Biography)
                .HasColumnType("mediumtext")
                .HasColumnName("biography");
            entity.Property(e => e.EventId).HasColumnName("event_id");
            entity.Property(e => e.PerformerId).HasColumnName("performer_id");

            entity.HasOne(d => d.Event).WithMany(p => p.PerformerBiographies)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("performer_biographies_event_id");

            entity.HasOne(d => d.Performer).WithMany(p => p.PerformerBiographies)
                .HasForeignKey(d => d.PerformerId)
                .HasConstraintName("performer_biogrpahies_performer_id");
        });

        modelBuilder.Entity<PerformerImage>(entity =>
        {
            entity.HasKey(e => e.PerformerImageId).HasName("PRIMARY");

            entity.ToTable("performer_images");

            entity.HasIndex(e => e.PerformerId, "performer_images_performer_id_idx");

            entity.Property(e => e.PerformerImageId).HasColumnName("performer_image_id");
            entity.Property(e => e.ImagePath)
                .HasMaxLength(230)
                .HasColumnName("image_path");
            entity.Property(e => e.ImageType)
                .HasMaxLength(10)
                .HasColumnName("image_type");
            entity.Property(e => e.PerformerId).HasColumnName("performer_id");

            entity.HasOne(d => d.Performer).WithMany(p => p.PerformerImages)
                .HasForeignKey(d => d.PerformerId)
                .HasConstraintName("performer_images_performer_id");
        });

        modelBuilder.Entity<PerformerKeyword>(entity =>
        {
            entity.HasKey(e => e.PerformerKeywordId).HasName("PRIMARY");

            entity.ToTable("performer_keywords");

            entity.HasIndex(e => e.PerformerId, "perfomer_keywords_performer_id_idx");

            entity.HasIndex(e => e.KeywordId, "performer_keywords_keyword_id_idx");

            entity.Property(e => e.PerformerKeywordId).HasColumnName("performer_keyword_id");
            entity.Property(e => e.KeywordId).HasColumnName("keyword_id");
            entity.Property(e => e.PerformerId).HasColumnName("performer_id");

            entity.HasOne(d => d.Keyword).WithMany(p => p.PerformerKeywords)
                .HasForeignKey(d => d.KeywordId)
                .HasConstraintName("performer_keywords_keyword_id");

            entity.HasOne(d => d.Performer).WithMany(p => p.PerformerKeywords)
                .HasForeignKey(d => d.PerformerId)
                .HasConstraintName("perfomer_keywords_performer_id");
        });

        modelBuilder.Entity<PerformerName>(entity =>
        {
            entity.HasKey(e => e.PerformerNameId).HasName("PRIMARY");

            entity.ToTable("performer_names");

            entity.HasIndex(e => new { e.FirstName, e.MiddleName, e.LastName, e.Qualifiers, e.Honorifics }, "name_fulltext");

            entity.HasIndex(e => e.PerformerId, "performer_names_performer_id_idx");

            entity.Property(e => e.PerformerNameId).HasColumnName("performer_name_id");
            entity.Property(e => e.EndTime)
                .HasColumnType("date")
                .HasColumnName("end_time");
            entity.Property(e => e.FirstName)
                .HasMaxLength(100)
                .HasColumnName("first_name");
            entity.Property(e => e.Honorifics)
                .HasMaxLength(45)
                .HasColumnName("honorifics");
            entity.Property(e => e.LastName)
                .HasMaxLength(100)
                .HasColumnName("last_name");
            entity.Property(e => e.MiddleName)
                .HasMaxLength(100)
                .HasColumnName("middle_name");
            entity.Property(e => e.PerformerId).HasColumnName("performer_id");
            entity.Property(e => e.Qualifiers)
                .HasMaxLength(45)
                .HasColumnName("qualifiers");
            entity.Property(e => e.StartTime)
                .HasColumnType("date")
                .HasColumnName("start_time");

            entity.HasOne(d => d.Performer).WithMany(p => p.PerformerNames)
                .HasForeignKey(d => d.PerformerId)
                .HasConstraintName("performer_names_performer_id");
        });

        modelBuilder.Entity<ProfileImage>(entity =>
        {
            entity.HasKey(e => e.ProfileImageId).HasName("PRIMARY");

            entity.ToTable("profile_images");

            entity.HasIndex(e => e.UserId, "profile_images_user_id_idx");

            entity.Property(e => e.ProfileImageId).HasColumnName("profile_image_id");
            entity.Property(e => e.ImageName)
                .HasMaxLength(200)
                .HasColumnName("image_name");
            entity.Property(e => e.ImagePath)
                .HasMaxLength(260)
                .HasColumnName("image_path");
            entity.Property(e => e.ImageType)
                .HasMaxLength(10)
                .HasColumnName("image_type");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.ProfileImages)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("profile_images_user_id");
        });

        modelBuilder.Entity<RecordingSearch>(entity =>
        {
            entity.HasKey(e => e.RecordingSearchId).HasName("PRIMARY");

            entity.ToTable("recording_search");

            entity.HasIndex(e => e.AttributeId, "recording_search_attribute_id_idx");

            entity.HasIndex(e => e.DomainId, "recording_search_domain_id_idx");

            entity.HasIndex(e => e.OriginatorId, "recording_search_originator_id_idx");

            entity.HasIndex(e => e.PerformanceRecordingId, "recording_search_performance_recording_id_idx");

            entity.Property(e => e.RecordingSearchId).HasColumnName("recording_search_id");
            entity.Property(e => e.AttributeId).HasColumnName("attribute_id");
            entity.Property(e => e.DomainId).HasColumnName("domain_id");
            entity.Property(e => e.OriginatorId).HasColumnName("originator_id");
            entity.Property(e => e.PerformanceRecordingId).HasColumnName("performance_recording_id");

            entity.HasOne(d => d.Attribute).WithMany(p => p.RecordingSearches)
                .HasForeignKey(d => d.AttributeId)
                .HasConstraintName("recording_search_attribute_id");

            entity.HasOne(d => d.Domain).WithMany(p => p.RecordingSearches)
                .HasForeignKey(d => d.DomainId)
                .HasConstraintName("recording_search_domain_id");

            entity.HasOne(d => d.Originator).WithMany(p => p.RecordingSearches)
                .HasForeignKey(d => d.OriginatorId)
                .HasConstraintName("recording_search_originator_id");

            entity.HasOne(d => d.PerformanceRecording).WithMany(p => p.RecordingSearches)
                .HasForeignKey(d => d.PerformanceRecordingId)
                .HasConstraintName("recording_search_performance_recording_id");
        });

        modelBuilder.Entity<RoleType>(entity =>
        {
            entity.HasKey(e => e.RoleTypeId).HasName("PRIMARY");

            entity.ToTable("role_type");

            entity.Property(e => e.RoleTypeId).HasColumnName("role_type_id");
            entity.Property(e => e.Name)
                .HasMaxLength(45)
                .HasColumnName("name");
        });

        modelBuilder.Entity<TitlePage>(entity =>
        {
            entity.HasKey(e => e.TitlePageId).HasName("PRIMARY");

            entity.ToTable("title_page");

            entity.Property(e => e.TitlePageId).HasColumnName("title_page_id");
            entity.Property(e => e.PageDescription)
                .HasColumnType("text")
                .HasColumnName("page_description");
            entity.Property(e => e.ReadMoreLink)
                .HasMaxLength(45)
                .HasColumnName("read_more_link");
            entity.Property(e => e.Subheading)
                .HasMaxLength(500)
                .HasColumnName("subheading");
            entity.Property(e => e.TitleImagePath)
                .HasMaxLength(260)
                .HasColumnName("title_image_path");
        });

        modelBuilder.Entity<TranscriptionRecording>(entity =>
        {
            entity.HasKey(e => e.TranscriptionRecordingId).HasName("PRIMARY");

            entity.ToTable("transcription_recording");

            entity.HasIndex(e => e.PerformanceRecordingId, "transcription_recording_performance_recording_idx");

            entity.HasIndex(e => e.TranscriptionId, "transcription_recording_transcription_id_idx");

            entity.Property(e => e.TranscriptionRecordingId).HasColumnName("transcription_recording_id");
            entity.Property(e => e.PerformanceRecordingId).HasColumnName("Performance_recording_id");
            entity.Property(e => e.TranscriptionId).HasColumnName("transcription_id");

            entity.HasOne(d => d.PerformanceRecording).WithMany(p => p.TranscriptionRecordings)
                .HasForeignKey(d => d.PerformanceRecordingId)
                .HasConstraintName("transcription_recording_performance_recording");

            entity.HasOne(d => d.Transcription).WithMany(p => p.TranscriptionRecordings)
                .HasForeignKey(d => d.TranscriptionId)
                .HasConstraintName("transcription_recording_transcription_id");
        });

        modelBuilder.Entity<TranscriptionSrt>(entity =>
        {
            entity.HasKey(e => e.TranscriptionId).HasName("PRIMARY");

            entity.ToTable("transcription_srt");

            entity.HasIndex(e => e.LineByLine, "line_by_line_fulltext");

            entity.Property(e => e.TranscriptionId).HasColumnName("transcription_id");
            entity.Property(e => e.FromFile)
                .HasMaxLength(260)
                .HasColumnName("from_file");
            entity.Property(e => e.LineByLine)
                .HasColumnType("longtext")
                .HasColumnName("line_by_line");
            entity.Property(e => e.PermissionToRelease)
                .HasColumnType("bit(1)")
                .HasColumnName("permission_to_release");
            entity.Property(e => e.ReadyForRelease)
                .HasColumnType("bit(1)")
                .HasColumnName("ready_for_release");
            entity.Property(e => e.SequenceEnd).HasColumnName("sequence_end");
            entity.Property(e => e.SequenceNumber).HasColumnName("sequence_number");
            entity.Property(e => e.SequenceStart).HasColumnName("sequence_start");
            entity.Property(e => e.SrtCaption)
                .HasMaxLength(100)
                .HasColumnName("srt_caption");
            entity.Property(e => e.SrtFilepath)
                .HasMaxLength(260)
                .HasColumnName("srt_filepath");
            entity.Property(e => e.SrtTimestamp)
                .HasColumnType("timestamp")
                .HasColumnName("srt_timestamp");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("users");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DisplayName)
                .HasMaxLength(45)
                .HasColumnName("display_name");
            entity.Property(e => e.UserActivationKey)
                .HasMaxLength(45)
                .HasColumnName("user_activation_key");
            entity.Property(e => e.UserLogin)
                .HasMaxLength(50)
                .HasColumnName("user_login");
            entity.Property(e => e.UserNicename)
                .HasMaxLength(45)
                .HasColumnName("user_nicename");
            entity.Property(e => e.UserPassword)
                .HasMaxLength(45)
                .HasColumnName("user_password");
            entity.Property(e => e.UserRegistered)
                .HasMaxLength(45)
                .HasColumnName("user_registered");
            entity.Property(e => e.UserStatus)
                .HasMaxLength(45)
                .HasColumnName("user_status");
            entity.Property(e => e.UserUrl)
                .HasMaxLength(100)
                .HasColumnName("user_url");
        });

        modelBuilder.Entity<UserAddress>(entity =>
        {
            entity.HasKey(e => e.UserAddressId).HasName("PRIMARY");

            entity.ToTable("user_addresses");

            entity.HasIndex(e => e.UserId, "user_addresses_user_id_idx");

            entity.Property(e => e.UserAddressId).HasColumnName("user_address_id");
            entity.Property(e => e.City)
                .HasMaxLength(25)
                .HasColumnName("city");
            entity.Property(e => e.Country)
                .HasMaxLength(55)
                .HasColumnName("country");
            entity.Property(e => e.PrimaryAddress)
                .HasMaxLength(35)
                .HasColumnName("primary_address");
            entity.Property(e => e.RegionalDivision)
                .HasMaxLength(85)
                .HasColumnName("regional_division");
            entity.Property(e => e.StreetAddress1)
                .HasMaxLength(35)
                .HasColumnName("street_address_1");
            entity.Property(e => e.StreetAddress2)
                .HasMaxLength(35)
                .HasColumnName("street_address_2");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.UserAddresses)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("user_addresses_user_id");
        });

        modelBuilder.Entity<UserGender>(entity =>
        {
            entity.HasKey(e => e.UserGenderId).HasName("PRIMARY");

            entity.ToTable("user_genders");

            entity.HasIndex(e => e.UserId, "id_idx");

            entity.Property(e => e.UserGenderId).HasColumnName("user_gender_id");
            entity.Property(e => e.EndTime)
                .HasColumnType("datetime")
                .HasColumnName("end_time");
            entity.Property(e => e.Gender)
                .HasMaxLength(45)
                .HasColumnName("gender");
            entity.Property(e => e.StartTime)
                .HasColumnType("datetime")
                .HasColumnName("start_time");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.UserGenders)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("user_genders_user_id");
        });

        modelBuilder.Entity<UserName>(entity =>
        {
            entity.HasKey(e => e.UserNameId).HasName("PRIMARY");

            entity.ToTable("user_name");

            entity.HasIndex(e => e.UsersId, "fk_user_name_users1_idx");

            entity.Property(e => e.UserNameId).HasColumnName("user_name_id");
            entity.Property(e => e.EndTime)
                .HasColumnType("datetime")
                .HasColumnName("end_time");
            entity.Property(e => e.FirstName)
                .HasMaxLength(45)
                .HasColumnName("first_name");
            entity.Property(e => e.Honorifics)
                .HasMaxLength(250)
                .HasColumnName("honorifics");
            entity.Property(e => e.LastName)
                .HasMaxLength(45)
                .HasColumnName("last_name");
            entity.Property(e => e.MiddleName)
                .HasMaxLength(45)
                .HasColumnName("middle_name");
            entity.Property(e => e.Qualifiers)
                .HasMaxLength(45)
                .HasColumnName("qualifiers");
            entity.Property(e => e.StartTime)
                .HasColumnType("datetime")
                .HasColumnName("start_time");
            entity.Property(e => e.UsersId).HasColumnName("users_id");

            entity.HasOne(d => d.Users).WithMany(p => p.UserNames)
                .HasForeignKey(d => d.UsersId)
                .HasConstraintName("fk_user_name_users1");
        });

        modelBuilder.Entity<UserPhoneNumber>(entity =>
        {
            entity.HasKey(e => e.UserPhoneNumberId).HasName("PRIMARY");

            entity.ToTable("user_phone_numbers");

            entity.HasIndex(e => e.UserId, "user_phone_number_user_id_idx");

            entity.Property(e => e.UserPhoneNumberId).HasColumnName("user_phone_number_id");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(10)
                .HasColumnName("country_code");
            entity.Property(e => e.IsPrimaryPhone)
                .HasColumnType("bit(1)")
                .HasColumnName("is_primary_phone");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(50)
                .HasColumnName("phone_number");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.UserPhoneNumbers)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("user_phone_number_user_id");
        });

        modelBuilder.Entity<UserRole>(entity =>
        {
            entity.HasKey(e => e.UserRoleId).HasName("PRIMARY");

            entity.ToTable("user_roles");

            entity.HasIndex(e => e.UserId, "id_idx");

            entity.HasIndex(e => e.UserId, "id_idx_user_roles");

            entity.HasIndex(e => e.RoleId, "user_roles_role_id_idx");

            entity.Property(e => e.UserRoleId).HasColumnName("user_role_id");
            entity.Property(e => e.EndTime)
                .HasColumnType("datetime")
                .HasColumnName("end_time");
            entity.Property(e => e.RoleId).HasColumnName("role_id");
            entity.Property(e => e.StartTime)
                .HasColumnType("datetime")
                .HasColumnName("start_time");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.Role).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("user_roles_role_id");

            entity.HasOne(d => d.User).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("user_roles_user_id");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
