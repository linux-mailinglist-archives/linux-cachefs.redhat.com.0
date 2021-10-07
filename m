Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D4C4F4254E9
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Oct 2021 15:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633615157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uPNCqqjfLkTOUcCTR7R/JE/i3ror7kh/6Tz4JXAoGoc=;
	b=NvCCwpWZUPRPLxKc5NvBBeqRqW4XNBFyzpTo8Fa3s3EQI58za/v/2+f0hCOsP0Q7ScOSMD
	9NDjz3j9DqZ8uNr4VaZ3ESHwyK5z7mqxjPz3CkEDkpZGOZeCCcYanKjGfg6VlYpNWfTQ9U
	KF+KLfQXIIg2Lk7FbR2t2qNZ8PvA9Lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-pmGkpizYMeeMtZMFWJz70A-1; Thu, 07 Oct 2021 09:59:02 -0400
X-MC-Unique: pmGkpizYMeeMtZMFWJz70A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D65718125C5;
	Thu,  7 Oct 2021 13:59:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A733B60583;
	Thu,  7 Oct 2021 13:58:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBCB34EA30;
	Thu,  7 Oct 2021 13:58:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197DgQ2C013922 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 09:42:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1A402024CC5; Thu,  7 Oct 2021 13:42:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45512200AE6E
	for <linux-cachefs@redhat.com>; Thu,  7 Oct 2021 13:42:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8692F805F49
	for <linux-cachefs@redhat.com>; Thu,  7 Oct 2021 13:42:24 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-564-KxPNFMvmM0qVJ40RXKHV0Q-1; Thu, 07 Oct 2021 09:42:09 -0400
X-MC-Unique: KxPNFMvmM0qVJ40RXKHV0Q-1
Received: by mail-ed1-f70.google.com with SMTP id
	t28-20020a508d5c000000b003dad7fc5caeso5905645edt.11
	for <linux-cachefs@redhat.com>; Thu, 07 Oct 2021 06:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P5JU8C3BiXtpns0YyWc4B8OVs5rM6VtoDVkoZlDZM7I=;
	b=rrWJbu5gi784xiyi1KNwH97lc+rjxVktXVNo1gw5ooNouer7KBRRRkBIt0ebl7JaTz
	jrgSBi9280TyacUkFJIXWsPHdME8iZsgXgyAq1DM94um6iokhbl3vEAz/VHzArGZnXrd
	B0gt1ORMuixd1G57LpASSA3FZSZdZuaMZa+fGfboDzNN49ul8avZqIXzQEpdulaLIT/2
	58wFnIMyEKyh87drHIhBhIn8Ppt4kM+Ej3GeWlnAI1y2ZVzNvjBCNsNTVHH2aKcr/7ii
	gFIjRjhAwHa7mGlDDS/A16q+qjsZ9c+LfBREPxDCqe9BLr7a4/e0WkJ+x+6aJZmjR1tz
	l6rQ==
X-Gm-Message-State: AOAM533sX41fEI6SZWB4/orlmNAGS5sUADLK0sBxR3MPcfpz8y8lfL1y
	AEcvJ4KCt8SjHEx6Xq94U3EGwd5S100KtYjqPm2nMW+rNWjxgUyk53cCkDfmw3cIcrCKMoTFrNf
	hyixtcNiUiu2rPZ61N5q1Ri0BwDNLpSae0sQ07Q==
X-Received: by 2002:a50:d885:: with SMTP id p5mr6301281edj.255.1633614128420; 
	Thu, 07 Oct 2021 06:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcvsxc+y8frXXhP7lqXdbtdnf4NIPXFFBdZ6nyc1k14xRTVCXUWIgFqYn0ldpiqb3SiRBVypusoATbszknLHU=
X-Received: by 2002:a50:d885:: with SMTP id p5mr6301251edj.255.1633614128211; 
	Thu, 07 Oct 2021 06:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
	<1633288958-8481-6-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633288958-8481-6-git-send-email-dwysocha@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 7 Oct 2021 09:41:31 -0400
Message-ID: <CALF+zO=J_W3a89J6BY7FYjSdz0_G04f00Ycgm7H6ax55heufug@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] [PATCH v1 5/7] NFS: Replace dfprintks in favor
 of tracepoints in fscache IO paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 3, 2021 at 3:23 PM Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> Most of fscache and other NFS IO paths are now using tracepoints,
> so remove the dfprintks in these code paths and replace with a couple
> tracepoints to track page IO.
>
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
>  fs/nfs/fscache.c  | 22 +++----------
>  fs/nfs/nfstrace.h | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+), 18 deletions(-)
>
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index a2b517846787..1db1e298b915 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -335,22 +335,17 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
>  {
>         int ret;
>
> -       dfprintk(FSCACHE,
> -                "NFS: readpage_from_fscache(fsc:%p/p:%p(i:%lx f:%lx)/0x%p)\n",
> -                nfs_i_fscache(inode), page, page->index, page->flags, inode);
> -
>         if (PageChecked(page)) {
> -               dfprintk(FSCACHE, "NFS:    readpage_from_fscache: PageChecked\n");
>                 ClearPageChecked(page);
>                 return 1;
>         }
>
> +       trace_nfs_fscache_page_event_read(inode, page);
>         ret = fscache_fallback_read_page(nfs_i_fscache(inode), page);
> +       trace_nfs_fscache_page_event_read_done(inode, page, ret);
>
>         switch (ret) {
>         case 0: /* Read completed synchronously */
> -               dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache: read successful\n");
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
>                 SetPageUptodate(page);
>                 return 0;
> @@ -358,13 +353,10 @@ int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
>         case -ENOBUFS: /* inode not in cache */
>         case -ENODATA: /* page not in cache */
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
> -               dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache failed %d\n", ret);
>                 SetPageChecked(page);
>                 return 1;
>
>         default:
> -               dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n", ret);
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
>                 SetPageChecked(page);
>         }
> @@ -378,15 +370,9 @@ void __nfs_readpage_to_fscache(struct inode *inode, struct page *page)
>  {
>         int ret;
>
> -       dfprintk(FSCACHE,
> -                "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx))\n",
> -                nfs_i_fscache(inode), page, page->index, page->flags);
> -
> +       trace_nfs_fscache_page_event_write(inode, page);
>         ret = fscache_fallback_write_page(nfs_i_fscache(inode), page);
> -
> -       dfprintk(FSCACHE,
> -                "NFS:     readpage_to_fscache: p:%p(i:%lu f:%lx) ret %d\n",
> -                page, page->index, page->flags, ret);
> +       trace_nfs_fscache_page_event_write_done(inode, page, ret);
>
>         if (ret != 0) {
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
> diff --git a/fs/nfs/nfstrace.h b/fs/nfs/nfstrace.h
> index b4177f57f69b..662dddc2eb96 100644
> --- a/fs/nfs/nfstrace.h
> +++ b/fs/nfs/nfstrace.h
> @@ -880,6 +880,103 @@
>                 )
>  );
>
> +DECLARE_EVENT_CLASS(nfs_fscache_page_event,
> +               TP_PROTO(
> +                       const struct inode *inode,
> +                       const struct page *page
> +               ),
> +
> +               TP_ARGS(inode, page),
> +
> +               TP_STRUCT__entry(
> +                       __field(dev_t, dev)
> +                       __field(u32, fhandle)
> +                       __field(u64, fileid)
> +                       __field(loff_t, offset)
> +                       __field(u32, count)
> +               ),
> +
> +               TP_fast_assign(
> +                       const struct nfs_inode *nfsi = NFS_I(inode);
> +                       const struct nfs_fh *fh = &nfsi->fh;
> +
> +                       __entry->offset = page->index << PAGE_SHIFT;
> +                       __entry->count = 4096;
> +                       __entry->dev = inode->i_sb->s_dev;
> +                       __entry->fileid = nfsi->fileid;
> +                       __entry->fhandle = nfs_fhandle_hash(fh);
> +               ),
> +
> +               TP_printk(
> +                       "fileid=%02x:%02x:%llu fhandle=0x%08x "
> +                       "offset=%lld count=%u",
> +                       MAJOR(__entry->dev), MINOR(__entry->dev),
> +                       (unsigned long long)__entry->fileid,
> +                       __entry->fhandle,
> +                       (long long)__entry->offset, __entry->count
> +               )
> +);
> +
> +DECLARE_EVENT_CLASS(nfs_fscache_page_event_done,
> +               TP_PROTO(
> +                       const struct inode *inode,
> +                       const struct page *page,
> +                       int error
> +               ),
> +
> +               TP_ARGS(inode, page, error),
> +
> +               TP_STRUCT__entry(
> +                       __field(int, error)
> +                       __field(dev_t, dev)
> +                       __field(u32, fhandle)
> +                       __field(u64, fileid)
> +                       __field(loff_t, offset)
> +                       __field(u32, count)
> +               ),
> +
> +               TP_fast_assign(
> +                       const struct nfs_inode *nfsi = NFS_I(inode);
> +                       const struct nfs_fh *fh = &nfsi->fh;
> +
> +                       __entry->offset = page->index << PAGE_SHIFT;
> +                       __entry->count = 4096;
> +                       __entry->dev = inode->i_sb->s_dev;
> +                       __entry->fileid = nfsi->fileid;
> +                       __entry->fhandle = nfs_fhandle_hash(fh);
> +                       __entry->error = error;
> +               ),
> +
> +               TP_printk(
> +                       "fileid=%02x:%02x:%llu fhandle=0x%08x "
> +                       "offset=%lld count=%u error=%d",
> +                       MAJOR(__entry->dev), MINOR(__entry->dev),
> +                       (unsigned long long)__entry->fileid,
> +                       __entry->fhandle,
> +                       (long long)__entry->offset, __entry->count,
> +                       __entry->error
> +               )
> +);
> +#define DEFINE_NFS_FSCACHE_PAGE_EVENT(name) \
> +       DEFINE_EVENT(nfs_fscache_page_event, name, \
> +                       TP_PROTO( \
> +                               const struct inode *inode, \
> +                               const struct page *page \
> +                       ), \
> +                       TP_ARGS(inode, page))
> +#define DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(name) \
> +       DEFINE_EVENT(nfs_fscache_page_event_done, name, \
> +                       TP_PROTO( \
> +                               const struct inode *inode, \
> +                               const struct page *page, \
> +                               int error \
> +                       ), \
> +                       TP_ARGS(inode, page, error))
> +DEFINE_NFS_FSCACHE_PAGE_EVENT(nfs_fscache_page_event_read);
> +DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(nfs_fscache_page_event_read_done);
> +DEFINE_NFS_FSCACHE_PAGE_EVENT(nfs_fscache_page_event_write);
> +DEFINE_NFS_FSCACHE_PAGE_EVENT_DONE(nfs_fscache_page_event_write_done);
> +
>  TRACE_EVENT(nfs_initiate_read,
>                 TP_PROTO(
>                         const struct nfs_pgio_header *hdr
> --
> 1.8.3.1
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs
>

This is unnecessarily complicated.  I'm reworking this to:
- add a patch that renames nfs_readpage_to_fscache to
nfs_fscache_read_page and nfs_readpage_from_fscache to
nfs_fscache_write_page; this matches the fallback API and is clearer
- add a single tracepoint only at the return point of these two
functions, printing the return value

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

