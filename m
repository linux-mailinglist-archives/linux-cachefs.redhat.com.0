Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DEF435435
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Oct 2021 21:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634759888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hww/iK/DymtN9oW9aWD74J5eDvqsazHbnNIm6TR6JrQ=;
	b=WdV63zP3L1djLxbbOje9qvW6NxDVoRmqrn/Pe1PHmXniMCaofbkfS3XBOJtvI4Yymunf/i
	wnxTOijQVQrvWZ5r5LvlgSTb4PDnI4M2PD2gpazdY8fHrXwB1VSZi7Z/QaDk8q0AIkF7z5
	2tXV0QgW1+1YMztEq5Y9xQYnN6qFggk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-JPH_cKibNJeQ8GsqGBQPyw-1; Wed, 20 Oct 2021 15:58:05 -0400
X-MC-Unique: JPH_cKibNJeQ8GsqGBQPyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6B810B3940;
	Wed, 20 Oct 2021 19:58:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EEF170911;
	Wed, 20 Oct 2021 19:58:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA4C3180BAD2;
	Wed, 20 Oct 2021 19:58:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KJsBt6004207 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 15:54:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E38151007246; Wed, 20 Oct 2021 19:54:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF63810070B5
	for <linux-cachefs@redhat.com>; Wed, 20 Oct 2021 19:54:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 716F8180F6DA
	for <linux-cachefs@redhat.com>; Wed, 20 Oct 2021 19:54:05 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-595-TEhqfZsJPOaVsxO9lxt7yA-1; Wed, 20 Oct 2021 15:54:04 -0400
X-MC-Unique: TEhqfZsJPOaVsxO9lxt7yA-1
Received: by mail-ed1-f72.google.com with SMTP id
	t18-20020a056402021200b003db9e6b0e57so22050444edv.10
	for <linux-cachefs@redhat.com>; Wed, 20 Oct 2021 12:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pniunILaSn/hzIB/5zP3tqKBdSvzKkZgYmhtJvDwjCU=;
	b=hjcIecczvZxJOM3DnmCg2fGgKj3eD3K2P/YwBnD7+cvvad42CbfNOAasJLTt/YXB+K
	+vige/p1W/sM1ODr3yishV87CpW2iu+mD8Q51SUTZV5oAxprE66GgGBauIt8uAX/t5/z
	li1cs6g0+6eJuGJ2SqWYK6rg769ZMQSFHEwNVpdf6w4KX09dNftzgBfa+ebGQEiUUxCV
	F+LKqOtMq1yrCqqe2IIOLe1f/SLma+WM7801IFl+FLNibMeMatB04wpG2Xh8D9hEkNL0
	FA+XDtR7WM+P5clxZ17gBE/5X9e3x3uRv5MDGoihrVVrJNftP/JC2FHfJxUH62BXgIxo
	lRcw==
X-Gm-Message-State: AOAM530rPkV8Y/mnS8nzY02l0UBNud0P4ZiZfzRWFCazJRYdHFoBrtAo
	/KZdeAo3ZHCQuFpdao4RlJcNwnmnfLLYqzVA1jKm0miy5RCIlx53tngk8M7GiKxDe9ZykCaBdnM
	NJEl/f7Ea/HuZKWc6dDIYweSZmZzqX/UNshvG0w==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr1341913edk.11.1634759642922; 
	Wed, 20 Oct 2021 12:54:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBw6V+b9V4aXsja4PT9xde9cTy3qTkYWyEyIxufDogutNv8meUsza2e2MtfOhvygkF0qVYjHe0F2YorMNP+zs=
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr1341872edk.11.1634759642650; 
	Wed, 20 Oct 2021 12:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <1633782962-18335-1-git-send-email-dwysocha@redhat.com>
	<1633782962-18335-2-git-send-email-dwysocha@redhat.com>
	<33f3ce883c7f874e2aa684f3ad83882bf7c38acb.camel@hammerspace.com>
In-Reply-To: <33f3ce883c7f874e2aa684f3ad83882bf7c38acb.camel@hammerspace.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 20 Oct 2021 15:53:26 -0400
Message-ID: <CALF+zO=F+2xETFg2kJXO+bC5Z2B52Rz_MQeSdcRF+cnfZ3WdxA@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"chuck.lever@oracle.com" <chuck.lever@oracle.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 1/1] NFS: Convert from readpages() to
	readahead()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 3:27 PM Trond Myklebust <trondmy@hammerspace.com> wrote:
>
> On Sat, 2021-10-09 at 08:36 -0400, Dave Wysochanski wrote:
> > Convert to the new VM readahead() API which is the preferred API
> > to read multiple pages, and rename the NFSIOS_* counters and the
> > tracepoint as needed.
> >
> > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > ---
> >  fs/nfs/file.c              |  2 +-
> >  fs/nfs/read.c              | 18 +++++++++++++-----
> >  include/linux/nfs_fs.h     |  3 +--
> >  include/linux/nfs_iostat.h |  6 +++---
> >  4 files changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> > index 209dac208477..cc76d17fa97f 100644
> > --- a/fs/nfs/file.c
> > +++ b/fs/nfs/file.c
> > @@ -519,7 +519,7 @@ static void nfs_swap_deactivate(struct file
> > *file)
> >
> >  const struct address_space_operations nfs_file_aops = {
> >         .readpage = nfs_readpage,
> > -       .readpages = nfs_readpages,
> > +       .readahead = nfs_readahead,
> >         .set_page_dirty = __set_page_dirty_nobuffers,
> >         .writepage = nfs_writepage,
> >         .writepages = nfs_writepages,
> > diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> > index d06b91a101d2..296ea9a9b6ce 100644
> > --- a/fs/nfs/read.c
> > +++ b/fs/nfs/read.c
> > @@ -397,15 +397,19 @@ int nfs_readpage(struct file *file, struct page
> > *page)
> >         return ret;
> >  }
> >
> > -int nfs_readpages(struct file *file, struct address_space *mapping,
> > -               struct list_head *pages, unsigned nr_pages)
> > +void nfs_readahead(struct readahead_control *ractl)
> >  {
> > +       struct file *file = ractl->file;
> > +       struct address_space *mapping = ractl->mapping;
> > +       struct page *page;
> > +       unsigned int nr_pages = readahead_count(ractl);
> > +
> >         struct nfs_readdesc desc;
> >         struct inode *inode = mapping->host;
> >         int ret;
> >
> >         trace_nfs_aop_readahead(inode, nr_pages);
> > -       nfs_inc_stats(inode, NFSIOS_VFSREADPAGES);
> > +       nfs_inc_stats(inode, NFSIOS_VFSREADAHEAD);
> >
> >         ret = -ESTALE;
> >         if (NFS_STALE(inode))
> > @@ -422,14 +426,18 @@ int nfs_readpages(struct file *file, struct
> > address_space *mapping,
>
>
> This function fails to compile due to the call to
> nfs_readpages_from_fscache() taking a 'pages' argument.
>

Sorry about the confusion.  See the "PATCH 0/1" description [1].
This patch as posted assumes dhowells "fallback API" series.
Are you ok with that series, or do you still have concerns?

I am not sure if I can redo this patch without that series but I can
try if you're opposed to the fallback API series or see problems
such as merging conflicts or want this patch only for some reason.

Let me know what you want and I'll try to make it happen.

[1] https://marc.info/?l=linux-nfs&m=163378294028491&w=2




> >         nfs_pageio_init_read(&desc.pgio, inode, false,
> >                              &nfs_async_read_completion_ops);
> >
> > -       ret = read_cache_pages(mapping, pages, readpage_async_filler,
> > &desc);
> > +       ret = 0;
> > +       while (!ret && (page = readahead_page(ractl))) {
> > +               prefetchw(&page->flags);
> > +               ret = readpage_async_filler(&desc, page);
> > +               put_page(page);
> > +       }
> >
> >         nfs_pageio_complete_read(&desc.pgio);
> >
> >         put_nfs_open_context(desc.ctx);
> >  out:
> >         trace_nfs_aop_readahead_done(inode, nr_pages, ret);
> > -       return ret;
> >  }
> >
> >  int __init nfs_init_readpagecache(void)
> > diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
> > index 140187b57db8..a5aef2cbe4ee 100644
> > --- a/include/linux/nfs_fs.h
> > +++ b/include/linux/nfs_fs.h
> > @@ -586,8 +586,7 @@ extern int nfs_access_get_cached(struct inode
> > *inode, const struct cred *cred, s
> >   * linux/fs/nfs/read.c
> >   */
> >  extern int  nfs_readpage(struct file *, struct page *);
> > -extern int  nfs_readpages(struct file *, struct address_space *,
> > -               struct list_head *, unsigned);
> > +extern void nfs_readahead(struct readahead_control *);
> >
> >  /*
> >   * inline functions
> > diff --git a/include/linux/nfs_iostat.h b/include/linux/nfs_iostat.h
> > index 027874c36c88..418145f23700 100644
> > --- a/include/linux/nfs_iostat.h
> > +++ b/include/linux/nfs_iostat.h
> > @@ -22,7 +22,7 @@
> >  #ifndef _LINUX_NFS_IOSTAT
> >  #define _LINUX_NFS_IOSTAT
> >
> > -#define NFS_IOSTAT_VERS                "1.1"
> > +#define NFS_IOSTAT_VERS                "1.2"
> >
> >  /*
> >   * NFS byte counters
> > @@ -53,7 +53,7 @@
> >   * NFS page counters
> >   *
> >   * These count the number of pages read or written via
> > nfs_readpage(),
> > - * nfs_readpages(), or their write equivalents.
> > + * nfs_readahead(), or their write equivalents.
> >   *
> >   * NB: When adding new byte counters, please include the measured
> >   * units in the name of each byte counter to help users of this
> > @@ -98,7 +98,7 @@ enum nfs_stat_eventcounters {
> >         NFSIOS_VFSACCESS,
> >         NFSIOS_VFSUPDATEPAGE,
> >         NFSIOS_VFSREADPAGE,
> > -       NFSIOS_VFSREADPAGES,
> > +       NFSIOS_VFSREADAHEAD,
> >         NFSIOS_VFSWRITEPAGE,
> >         NFSIOS_VFSWRITEPAGES,
> >         NFSIOS_VFSGETDENTS,
>
> --
> Trond Myklebust
> Linux NFS client maintainer, Hammerspace
> trond.myklebust@hammerspace.com
>
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

