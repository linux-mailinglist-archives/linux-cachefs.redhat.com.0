Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD249F02A
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Jan 2022 01:55:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-fE09_juZOMuQtGCaN_rwHg-1; Thu, 27 Jan 2022 19:55:55 -0500
X-MC-Unique: fE09_juZOMuQtGCaN_rwHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A20CA1083F60;
	Fri, 28 Jan 2022 00:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7F45F908;
	Fri, 28 Jan 2022 00:55:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA2A51809CB9;
	Fri, 28 Jan 2022 00:55:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20S0thYf028179 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 19:55:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B2C182166B1F; Fri, 28 Jan 2022 00:55:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA412166B3F
	for <linux-cachefs@redhat.com>; Fri, 28 Jan 2022 00:55:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D69F800B29
	for <linux-cachefs@redhat.com>; Fri, 28 Jan 2022 00:55:40 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-365-POt60OZzOS2LqCOEZlBKNA-1; Thu, 27 Jan 2022 19:55:36 -0500
X-MC-Unique: POt60OZzOS2LqCOEZlBKNA-1
Received: by mail-lf1-f49.google.com with SMTP id a28so8593354lfl.7;
	Thu, 27 Jan 2022 16:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uPfqXqCnZQyWiLqoHqK+K6Sm6LUScfhldLkzmE86PYs=;
	b=6aeUVPL0YOe1CFPeoVAGW7p8fDyk88umhuz+Wy4p7odi7gwWINSNb4ZXwiCDjCl3f1
	OUFpOZVeueeTh7bl/XiZjzcuR2IE440GoISbrEVs36/7QafE4wdxylrm7pr1YPcDXRwO
	D/ORjzFr57YWv9ygqo6XjhDLgiqekJI9jqLbFltBK3aRvP0z0KiP9qgKB4vuNwTuUdsy
	p2JawK6LhD/xYBGp/EWRm9Jo2y0wYqIMLUrWHxzUA8DSkQgblNwzKuitf5xsCQ1e6Rwu
	HoSJIyez5XDCFUBeFv0z+SAx2HhBQQXAVPtRrJmA2PlfJRPyfCB15kPRsvmAA8lhN1XK
	HRTA==
X-Gm-Message-State: AOAM533GJvU6+0h7vbofN1OC7O23i2gOZU/XhKQqTtbCjtcCSS97u/Mj
	CBop6d3Xjc7Oykj5wnIkwb/j9x3brQzGueytNepKanwyUbs=
X-Google-Smtp-Source: ABdhPJzKkwANx18s3dz7Q6/hs30nwVNez2elfD83wDb90hd4JZz6ctQ4An4hiHzAurhZiBcQe+MaSlifuxq5XFTdoWY=
X-Received: by 2002:a05:6512:2289:: with SMTP id
	f9mr4272518lfu.537.1643331334748; 
	Thu, 27 Jan 2022 16:55:34 -0800 (PST)
MIME-Version: 1.0
References: <164329930161.843658.7387773437540491743.stgit@warthog.procyon.org.uk>
	<164329937835.843658.13129382687019174242.stgit@warthog.procyon.org.uk>
In-Reply-To: <164329937835.843658.13129382687019174242.stgit@warthog.procyon.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Thu, 27 Jan 2022 18:55:23 -0600
Message-ID: <CAH2r5mu4FeX2x=Xd0jDnQopTfhOBP_P91-NH-A+bNdx6THCu8A@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH 4/4] cifs: Implement cache I/O by
	accessing the cache directly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Regression tests so far on Dave's cifs fscache patch series are going
fine.  First series of tests I ran were this:
http://smb3-test-rhel-75.southcentralus.cloudapp.azure.com/#/builders/11/builds/160
but I have to run additional tests with fscache enabled etc.

I saw that checkpatch had some minor complaints on this patch (patch
4) which I cleaned up, but was wondering other's thoughts on this
checkpatch warning:

WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code
rather than BUG() or BUG_ON()
#101: FILE: fs/cifs/file.c:4449:

ie

+ page = readahead_page(ractl);
+ BUG_ON(!page);

On Thu, Jan 27, 2022 at 10:03 AM David Howells <dhowells@redhat.com> wrote:
>
> Move cifs to using fscache DIO API instead of the old upstream I/O API as
> that has been removed.  This is a stopgap solution as the intention is that
> at sometime in the future, the cache will move to using larger blocks and
> won't be able to store individual pages in order to deal with the potential
> for data corruption due to the backing filesystem being able insert/remove
> bridging blocks of zeros into its extent list[1].
>
> cifs then reads and writes cache pages synchronously and one page at a time.
>
> The preferred change would be to use the netfs lib, but the new I/O API can
> be used directly.  It's just that as the cache now needs to track data for
> itself, caching blocks may exceed page size...
>
> This code is somewhat borrowed from my "fallback I/O" patchset[2].
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Steve French <smfrench@gmail.com>
> cc: Shyam Prasad N <nspmangalore@gmail.com>
> cc: linux-cifs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
> Link: https://lore.kernel.org/r/202112100957.2oEDT20W-lkp@intel.com/ [2]
> ---
>
>  fs/cifs/file.c    |   55 +++++++++++++++++++++--
>  fs/cifs/fscache.c |  126 +++++++++++++++++++++++++++++++++++++++++++++--------
>  fs/cifs/fscache.h |   79 +++++++++++++++++++++------------
>  3 files changed, 207 insertions(+), 53 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index be62dc29dc54..1b41b6f2a04b 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -4276,12 +4276,12 @@ cifs_readv_complete(struct work_struct *work)
>                 } else
>                         SetPageError(page);
>
> -               unlock_page(page);
> -
>                 if (rdata->result == 0 ||
>                     (rdata->result == -EAGAIN && got_bytes))
>                         cifs_readpage_to_fscache(rdata->mapping->host, page);
>
> +               unlock_page(page);
> +
>                 got_bytes -= min_t(unsigned int, PAGE_SIZE, got_bytes);
>
>                 put_page(page);
> @@ -4396,7 +4396,11 @@ static void cifs_readahead(struct readahead_control *ractl)
>         struct cifs_sb_info *cifs_sb = CIFS_FILE_SB(ractl->file);
>         struct TCP_Server_Info *server;
>         pid_t pid;
> -       unsigned int xid, last_batch_size = 0;
> +       unsigned int xid, nr_pages, last_batch_size = 0, cache_nr_pages = 0;
> +       pgoff_t next_cached = ULONG_MAX;
> +       bool caching = fscache_cookie_enabled(cifs_inode_cookie(ractl->mapping->host)) &&
> +               cifs_inode_cookie(ractl->mapping->host)->cache_priv;
> +       bool check_cache = caching;
>
>         xid = get_xid();
>
> @@ -4414,12 +4418,52 @@ static void cifs_readahead(struct readahead_control *ractl)
>         /*
>          * Chop the readahead request up into rsize-sized read requests.
>          */
> -       while (readahead_count(ractl) - last_batch_size) {
> -               unsigned int i, nr_pages, got, rsize;
> +       while ((nr_pages = readahead_count(ractl) - last_batch_size)) {
> +               unsigned int i, got, rsize;
>                 struct page *page;
>                 struct cifs_readdata *rdata;
>                 struct cifs_credits credits_on_stack;
>                 struct cifs_credits *credits = &credits_on_stack;
> +               pgoff_t index = readahead_index(ractl) + last_batch_size;
> +
> +               /*
> +                * Find out if we have anything cached in the range of
> +                * interest, and if so, where the next chunk of cached data is.
> +                */
> +               if (caching) {
> +                       if (check_cache) {
> +                               rc = cifs_fscache_query_occupancy(
> +                                       ractl->mapping->host, index, nr_pages,
> +                                       &next_cached, &cache_nr_pages);
> +                               if (rc < 0)
> +                                       caching = false;
> +                               check_cache = false;
> +                       }
> +
> +                       if (index == next_cached) {
> +                               /*
> +                                * TODO: Send a whole batch of pages to be read
> +                                * by the cache.
> +                                */
> +                               page = readahead_page(ractl);
> +                               BUG_ON(!page);
> +                               if (cifs_readpage_from_fscache(ractl->mapping->host,
> +                                                              page) < 0) {
> +                                       /*
> +                                        * TODO: Deal with cache read failure
> +                                        * here, but for the moment, delegate
> +                                        * that to readpage.
> +                                        */
> +                                       caching = false;
> +                               }
> +                               unlock_page(page);
> +                               next_cached++;
> +                               cache_nr_pages--;
> +                               if (cache_nr_pages == 0)
> +                                       check_cache = true;
> +                               continue;
> +                       }
> +               }
>
>                 if (open_file->invalidHandle) {
>                         rc = cifs_reopen_file(open_file, true);
> @@ -4435,6 +4479,7 @@ static void cifs_readahead(struct readahead_control *ractl)
>                 if (rc)
>                         break;
>                 nr_pages = min_t(size_t, rsize / PAGE_SIZE, readahead_count(ractl));
> +               nr_pages = min_t(size_t, nr_pages, next_cached - index);
>
>                 /*
>                  * Give up immediately if rsize is too small to read an entire
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index efaac4d5ff55..f98cfcc0d397 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -134,37 +134,127 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
>         }
>  }
>
> +static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> +{
> +       const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> +
> +       if (ops)
> +               ops->end_operation(cres);
> +}
> +
>  /*
> - * Retrieve a page from FS-Cache
> + * Fallback page reading interface.
>   */
> -int __cifs_readpage_from_fscache(struct inode *inode, struct page *page)
> +static int fscache_fallback_read_page(struct inode *inode, struct page *page)
>  {
> -       cifs_dbg(FYI, "%s: (fsc:%p, p:%p, i:0x%p\n",
> -                __func__, CIFS_I(inode)->fscache, page, inode);
> -       return -ENOBUFS; // Needs conversion to using netfslib
> +       struct netfs_cache_resources cres;
> +       struct fscache_cookie *cookie = cifs_inode_cookie(inode);
> +       struct iov_iter iter;
> +       struct bio_vec bvec[1];
> +       int ret;
> +
> +       memset(&cres, 0, sizeof(cres));
> +       bvec[0].bv_page         = page;
> +       bvec[0].bv_offset       = 0;
> +       bvec[0].bv_len          = PAGE_SIZE;
> +       iov_iter_bvec(&iter, READ, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
> +
> +       ret = fscache_begin_read_operation(&cres, cookie);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
> +                          NULL, NULL);
> +       fscache_end_operation(&cres);
> +       return ret;
>  }
>
>  /*
> - * Retrieve a set of pages from FS-Cache
> + * Fallback page writing interface.
>   */
> -int __cifs_readpages_from_fscache(struct inode *inode,
> -                               struct address_space *mapping,
> -                               struct list_head *pages,
> -                               unsigned *nr_pages)
> +static int fscache_fallback_write_page(struct inode *inode, struct page *page,
> +                                      bool no_space_allocated_yet)
>  {
> -       cifs_dbg(FYI, "%s: (0x%p/%u/0x%p)\n",
> -                __func__, CIFS_I(inode)->fscache, *nr_pages, inode);
> -       return -ENOBUFS; // Needs conversion to using netfslib
> +       struct netfs_cache_resources cres;
> +       struct fscache_cookie *cookie = cifs_inode_cookie(inode);
> +       struct iov_iter iter;
> +       struct bio_vec bvec[1];
> +       loff_t start = page_offset(page);
> +       size_t len = PAGE_SIZE;
> +       int ret;
> +
> +       memset(&cres, 0, sizeof(cres));
> +       bvec[0].bv_page         = page;
> +       bvec[0].bv_offset       = 0;
> +       bvec[0].bv_len          = PAGE_SIZE;
> +       iov_iter_bvec(&iter, WRITE, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
> +
> +       ret = fscache_begin_write_operation(&cres, cookie);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = cres.ops->prepare_write(&cres, &start, &len, i_size_read(inode),
> +                                     no_space_allocated_yet);
> +       if (ret == 0)
> +               ret = fscache_write(&cres, page_offset(page), &iter, NULL, NULL);
> +       fscache_end_operation(&cres);
> +       return ret;
>  }
>
> -void __cifs_readpage_to_fscache(struct inode *inode, struct page *page)
> +/*
> + * Retrieve a page from FS-Cache
> + */
> +int __cifs_readpage_from_fscache(struct inode *inode, struct page *page)
>  {
> -       struct cifsInodeInfo *cifsi = CIFS_I(inode);
> +       int ret;
>
> -       WARN_ON(!cifsi->fscache);
> +       cifs_dbg(FYI, "%s: (fsc:%p, p:%p, i:0x%p\n",
> +                __func__, cifs_inode_cookie(inode), page, inode);
>
> +       ret = fscache_fallback_read_page(inode, page);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Read completed synchronously */
> +       SetPageUptodate(page);
> +       return 0;
> +}
> +
> +void __cifs_readpage_to_fscache(struct inode *inode, struct page *page)
> +{
>         cifs_dbg(FYI, "%s: (fsc: %p, p: %p, i: %p)\n",
> -                __func__, cifsi->fscache, page, inode);
> +                __func__, cifs_inode_cookie(inode), page, inode);
> +
> +       fscache_fallback_write_page(inode, page, true);
> +}
> +
> +/*
> + * Query the cache occupancy.
> + */
> +int __cifs_fscache_query_occupancy(struct inode *inode,
> +                                  pgoff_t first, unsigned nr_pages,
> +                                  pgoff_t *_data_first,
> +                                  unsigned int *_data_nr_pages)
> +{
> +       struct netfs_cache_resources cres;
> +       struct fscache_cookie *cookie = cifs_inode_cookie(inode);
> +       loff_t start, data_start;
> +       size_t len, data_len;
> +       int ret;
>
> -       // Needs conversion to using netfslib
> +       ret = fscache_begin_read_operation(&cres, cookie);
> +       if (ret < 0)
> +               return ret;
> +
> +       start = first * PAGE_SIZE;
> +       len = nr_pages * PAGE_SIZE;
> +       ret = cres.ops->query_occupancy(&cres, start, len, PAGE_SIZE,
> +                                       &data_start, &data_len);
> +       if (ret == 0) {
> +               *_data_first = data_start / PAGE_SIZE;
> +               *_data_nr_pages = len / PAGE_SIZE;
> +       }
> +
> +       fscache_end_operation(&cres);
> +       return ret;
>  }
> diff --git a/fs/cifs/fscache.h b/fs/cifs/fscache.h
> index c6ca49ac33d4..ed4b08df1961 100644
> --- a/fs/cifs/fscache.h
> +++ b/fs/cifs/fscache.h
> @@ -9,6 +9,7 @@
>  #ifndef _CIFS_FSCACHE_H
>  #define _CIFS_FSCACHE_H
>
> +#include <linux/swap.h>
>  #include <linux/fscache.h>
>
>  #include "cifsglob.h"
> @@ -58,14 +59,6 @@ void cifs_fscache_fill_coherency(struct inode *inode,
>  }
>
>
> -extern int cifs_fscache_release_page(struct page *page, gfp_t gfp);
> -extern int __cifs_readpage_from_fscache(struct inode *, struct page *);
> -extern int __cifs_readpages_from_fscache(struct inode *,
> -                                        struct address_space *,
> -                                        struct list_head *,
> -                                        unsigned *);
> -extern void __cifs_readpage_to_fscache(struct inode *, struct page *);
> -
>  static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode)
>  {
>         return CIFS_I(inode)->fscache;
> @@ -80,33 +73,52 @@ static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags
>                            i_size_read(inode), flags);
>  }
>
> -static inline int cifs_readpage_from_fscache(struct inode *inode,
> -                                            struct page *page)
> -{
> -       if (CIFS_I(inode)->fscache)
> -               return __cifs_readpage_from_fscache(inode, page);
> +extern int __cifs_fscache_query_occupancy(struct inode *inode,
> +                                         pgoff_t first, unsigned nr_pages,
> +                                         pgoff_t *_data_first,
> +                                         unsigned int *_data_nr_pages);
>
> -       return -ENOBUFS;
> +static inline int cifs_fscache_query_occupancy(struct inode *inode,
> +                                              pgoff_t first, unsigned nr_pages,
> +                                              pgoff_t *_data_first,
> +                                              unsigned int *_data_nr_pages)
> +{
> +       if (!cifs_inode_cookie(inode))
> +               return -ENOBUFS;
> +       return __cifs_fscache_query_occupancy(inode, first, nr_pages,
> +                                             _data_first, _data_nr_pages);
>  }
>
> -static inline int cifs_readpages_from_fscache(struct inode *inode,
> -                                             struct address_space *mapping,
> -                                             struct list_head *pages,
> -                                             unsigned *nr_pages)
> +extern int __cifs_readpage_from_fscache(struct inode *, struct page *);
> +extern void __cifs_readpage_to_fscache(struct inode *, struct page *);
> +
> +
> +static inline int cifs_readpage_from_fscache(struct inode *inode,
> +                                            struct page *page)
>  {
> -       if (CIFS_I(inode)->fscache)
> -               return __cifs_readpages_from_fscache(inode, mapping, pages,
> -                                                    nr_pages);
> +       if (cifs_inode_cookie(inode))
> +               return __cifs_readpage_from_fscache(inode, page);
>         return -ENOBUFS;
>  }
>
>  static inline void cifs_readpage_to_fscache(struct inode *inode,
>                                             struct page *page)
>  {
> -       if (PageFsCache(page))
> +       if (cifs_inode_cookie(inode))
>                 __cifs_readpage_to_fscache(inode, page);
>  }
>
> +static inline int cifs_fscache_release_page(struct page *page, gfp_t gfp)
> +{
> +       if (PageFsCache(page)) {
> +               if (current_is_kswapd() || !(gfp & __GFP_FS))
> +                       return false;
> +               wait_on_page_fscache(page);
> +               fscache_note_page_release(cifs_inode_cookie(page->mapping->host));
> +       }
> +       return true;
> +}
> +
>  #else /* CONFIG_CIFS_FSCACHE */
>  static inline
>  void cifs_fscache_fill_coherency(struct inode *inode,
> @@ -123,22 +135,29 @@ static inline void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool upd
>  static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode) { return NULL; }
>  static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags) {}
>
> -static inline int
> -cifs_readpage_from_fscache(struct inode *inode, struct page *page)
> +static inline int cifs_fscache_query_occupancy(struct inode *inode,
> +                                              pgoff_t first, unsigned nr_pages,
> +                                              pgoff_t *_data_first,
> +                                              unsigned int *_data_nr_pages)
>  {
> +       *_data_first = ULONG_MAX;
> +       *_data_nr_pages = 0;
>         return -ENOBUFS;
>  }
>
> -static inline int cifs_readpages_from_fscache(struct inode *inode,
> -                                             struct address_space *mapping,
> -                                             struct list_head *pages,
> -                                             unsigned *nr_pages)
> +static inline int
> +cifs_readpage_from_fscache(struct inode *inode, struct page *page)
>  {
>         return -ENOBUFS;
>  }
>
> -static inline void cifs_readpage_to_fscache(struct inode *inode,
> -                       struct page *page) {}
> +static inline
> +void cifs_readpage_to_fscache(struct inode *inode, struct page *page) {}
> +
> +static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
> +{
> +       return true; /* May release page */
> +}
>
>  #endif /* CONFIG_CIFS_FSCACHE */
>
>
>


-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

