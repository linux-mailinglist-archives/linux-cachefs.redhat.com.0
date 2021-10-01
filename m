Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4B641EB7F
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 13:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633086765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iDRstsz2lsP8nIrV8FAlD5t7htZH1pPq0Obo/zSQfjk=;
	b=bI2Ef8bjBIqQTR1KHWlm3ItCwtT/9cn7tRenaoqPYtDUyldfaSGwAwntmBy37/EpFfxcAf
	3ttmHmw2dIPW6PUMbRKJvW4bPqvceA4eKRbfe7Ck66vYT+puUax0QNQH9ySCPYsyPaFxQD
	DgP1vd3sULNEQA4hmBfEQUxtchfIBo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-oTZgn0TUPxeQtBOw7mW_rg-1; Fri, 01 Oct 2021 07:12:44 -0400
X-MC-Unique: oTZgn0TUPxeQtBOw7mW_rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9EDE84A5E0;
	Fri,  1 Oct 2021 11:12:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 506F0608BA;
	Fri,  1 Oct 2021 11:12:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B939B1800B8B;
	Fri,  1 Oct 2021 11:12:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191BCaPm032489 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 07:12:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D65502167D9F; Fri,  1 Oct 2021 11:12:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C837D2167D94
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 11:12:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD7B3800B26
	for <linux-cachefs@redhat.com>; Fri,  1 Oct 2021 11:12:29 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146-yVVMyhLePnmDMpjLteKssA-1; Fri, 01 Oct 2021 07:12:28 -0400
X-MC-Unique: yVVMyhLePnmDMpjLteKssA-1
Received: by mail-ed1-f69.google.com with SMTP id
	y15-20020a50ce0f000000b003dab997cf7dso6464841edi.9
	for <linux-cachefs@redhat.com>; Fri, 01 Oct 2021 04:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Q2Tch0ZnV9UDFxO2nowS6ZC3vfYxm+QYifsQU7RhN8=;
	b=biC/J/7kowPPbzQBGGNPWokt+q6rPGQXg2QFR6VE9qbvCnME8x4BfOo91RYA5ISH28
	e/foXlKjmTOpTwKI3ufOrXjfDr/1KNPouQMnv9vbzvdIwYs+gW/lM8ylPV79YrQcLO+5
	HhbvpRv4tpd1jIwE15Cz3D7RYgNR9mANcofQevq99sHaLW4NyrfKII4FpPK4mPdYyhTn
	/5DxD3Qr+8cc29sBh4zpqLhd94fb2tRYizWuRExV6V69yLM6r2SXf7vpsFJ6xdIz6bot
	CyT77/cI2k7qYhVDYaAkL0bby6FwyX5rfl15bklFj/WB0dDtDfkCLqurCPuJM5VCl3hf
	eSjQ==
X-Gm-Message-State: AOAM5334HPnessUwJA4CK5NL3Rd/fi1nxKtqlpR31DLspBst7MkfjihH
	qDkYkr+sreLXrBSamfc8V4zO5aXrtEsMkz2Idm7ARBaKZqrLDYlXYV4gln4RTrE/oQDqZhDg6F4
	wdUOf895yDBsiBhbuZkvHXFSDyXTZxmYnHtjW9A==
X-Received: by 2002:a17:906:660b:: with SMTP id
	b11mr5483023ejp.427.1633086746682; 
	Fri, 01 Oct 2021 04:12:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIQpQNu/cRirv15v1w6vPJOY7yr9g0ItSMXjDUQe5ePHIWLxu+cBLJzAP6CqgSqOxpjVIO4UCpc0MbQi/89HQ=
X-Received: by 2002:a17:906:660b:: with SMTP id
	b11mr5482988ejp.427.1633086746350; 
	Fri, 01 Oct 2021 04:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
In-Reply-To: <163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 1 Oct 2021 07:11:50 -0400
Message-ID: <CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v2 3/8] nfs: Move to using the alternate
 fallback fscache I/O API
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

On Fri, Sep 17, 2021 at 11:05 AM David Howells <dhowells@redhat.com> wrote:
>
> Move NFS to using the alternate fallback fscache I/O API instead of the
old
> upstream I/O API as that is about to be deleted.  The alternate API will
> also be deleted at some point in the future as it's dangerous (as is the
> old API) and can lead to data corruption if the backing filesystem can
> insert/remove bridging blocks of zeros into its extent list[1].
>
> The alternate API reads and writes pages synchronously, with the intention
> of allowing removal of the operation management framework and thence the
> object management framework from fscache.
>
> The preferred change would be to use the netfs lib, but the new I/O API
can
> be used directly.  It's just that as the cache now needs to track data for
> itself, caching blocks may exceed page size...
>
> Changes
> =======
> ver #2:
>   - Changed "deprecated" to "fallback" in the new function names[2].
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Trond Myklebust <trond.myklebust@hammerspace.com>
> cc: Anna Schumaker <anna.schumaker@netapp.com>
> cc: linux-nfs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
> Link:
https://lore.kernel.org/r/CAHk-=wiVK+1CyEjW8u71zVPK8msea=qPpznX35gnX+s8sXnJTg@mail.gmail.com/
[2]
> Link:
https://lore.kernel.org/r/163162771421.438332.11563297618174948818.stgit@warthog.procyon.org.uk/
# rfc
> ---
>
>  fs/nfs/file.c    |   14 +++--
>  fs/nfs/fscache.c |  161
+++++++-----------------------------------------------
>  fs/nfs/fscache.h |   85 ++++-------------------------
>  fs/nfs/read.c    |   25 +++-----
>  fs/nfs/write.c   |    7 ++
>  5 files changed, 55 insertions(+), 237 deletions(-)
>
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index aa353fd58240..209dac208477 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -416,7 +416,7 @@ static void nfs_invalidate_page(struct page *page,
unsigned int offset,
>         /* Cancel any unstarted writes on this page */
>         nfs_wb_page_cancel(page_file_mapping(page)->host, page);
>
> -       nfs_fscache_invalidate_page(page, page->mapping->host);
> +       wait_on_page_fscache(page);
>  }
>
>  /*
> @@ -432,7 +432,12 @@ static int nfs_release_page(struct page *page, gfp_t
gfp)
>         /* If PagePrivate() is set, then the page is not freeable */
>         if (PagePrivate(page))
>                 return 0;
> -       return nfs_fscache_release_page(page, gfp);
> +       if (PageFsCache(page)) {
> +               if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
> +                       return false;
> +               wait_on_page_fscache(page);
> +       }
> +       return true;
>  }
>
>  static void nfs_check_dirty_writeback(struct page *page,
> @@ -475,12 +480,11 @@ static void nfs_check_dirty_writeback(struct page
*page,
>  static int nfs_launder_page(struct page *page)
>  {
>         struct inode *inode = page_file_mapping(page)->host;
> -       struct nfs_inode *nfsi = NFS_I(inode);
>
>         dfprintk(PAGECACHE, "NFS: launder_page(%ld, %llu)\n",
>                 inode->i_ino, (long long)page_offset(page));
>
> -       nfs_fscache_wait_on_page_write(nfsi, page);
> +       wait_on_page_fscache(page);
>         return nfs_wb_page(inode, page);
>  }
>
> @@ -555,7 +559,7 @@ static vm_fault_t nfs_vm_page_mkwrite(struct vm_fault
*vmf)
>         sb_start_pagefault(inode->i_sb);
>
>         /* make sure the cache has finished storing the page */
> -       nfs_fscache_wait_on_page_write(NFS_I(inode), page);
> +       wait_on_page_fscache(page);
>
>         wait_on_bit_action(&NFS_I(inode)->flags, NFS_INO_INVALIDATING,
>                         nfs_wait_bit_killable, TASK_KILLABLE);
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index d743629e05e1..5b0e78742444 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -317,7 +317,6 @@ void nfs_fscache_open_file(struct inode *inode,
struct file *filp)
>                 dfprintk(FSCACHE, "NFS: nfsi 0x%p disabling cache\n",
nfsi);
>                 clear_bit(NFS_INO_FSCACHE, &nfsi->flags);
>                 fscache_disable_cookie(cookie, &auxdata, true);
> -               fscache_uncache_all_inode_pages(cookie, inode);
>         } else {
>                 dfprintk(FSCACHE, "NFS: nfsi 0x%p enabling cache\n",
nfsi);
>                 fscache_enable_cookie(cookie, &auxdata,
nfsi->vfs_inode.i_size,
> @@ -328,79 +327,10 @@ void nfs_fscache_open_file(struct inode *inode,
struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(nfs_fscache_open_file);
>
> -/*
> - * Release the caching state associated with a page, if the page isn't
busy
> - * interacting with the cache.
> - * - Returns true (can release page) or false (page busy).
> - */
> -int nfs_fscache_release_page(struct page *page, gfp_t gfp)
> -{
> -       if (PageFsCache(page)) {
> -               struct fscache_cookie *cookie =
nfs_i_fscache(page->mapping->host);
> -
> -               BUG_ON(!cookie);
> -               dfprintk(FSCACHE, "NFS: fscache releasepage
(0x%p/0x%p/0x%p)\n",
> -                        cookie, page, NFS_I(page->mapping->host));
> -
> -               if (!fscache_maybe_release_page(cookie, page, gfp))
> -                       return 0;
> -
> -               nfs_inc_fscache_stats(page->mapping->host,
> -                                     NFSIOS_FSCACHE_PAGES_UNCACHED);
> -       }
> -
> -       return 1;
> -}
> -
> -/*
> - * Release the caching state associated with a page if undergoing
complete page
> - * invalidation.
> - */
> -void __nfs_fscache_invalidate_page(struct page *page, struct inode
*inode)
> -{
> -       struct fscache_cookie *cookie = nfs_i_fscache(inode);
> -
> -       BUG_ON(!cookie);
> -
> -       dfprintk(FSCACHE, "NFS: fscache invalidatepage
(0x%p/0x%p/0x%p)\n",
> -                cookie, page, NFS_I(inode));
> -
> -       fscache_wait_on_page_write(cookie, page);
> -
> -       BUG_ON(!PageLocked(page));
> -       fscache_uncache_page(cookie, page);
> -       nfs_inc_fscache_stats(page->mapping->host,
> -                             NFSIOS_FSCACHE_PAGES_UNCACHED);
> -}
> -
> -/*
> - * Handle completion of a page being read from the cache.
> - * - Called in process (keventd) context.
> - */
> -static void nfs_readpage_from_fscache_complete(struct page *page,
> -                                              void *context,
> -                                              int error)
> -{
> -       dfprintk(FSCACHE,
> -                "NFS: readpage_from_fscache_complete (0x%p/0x%p/%d)\n",
> -                page, context, error);
> -
> -       /*
> -        * If the read completes with an error, mark the page with
PG_checked,
> -        * unlock the page, and let the VM reissue the readpage.
> -        */
> -       if (!error)
> -               SetPageUptodate(page);
> -       else
> -               SetPageChecked(page);
> -       unlock_page(page);
> -}
> -
>  /*
>   * Retrieve a page from fscache
>   */
> -int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
> -                               struct inode *inode, struct page *page)
> +int __nfs_readpage_from_fscache(struct inode *inode, struct page *page)
>  {
>         int ret;
>
> @@ -409,112 +339,63 @@ int __nfs_readpage_from_fscache(struct
nfs_open_context *ctx,
>                  nfs_i_fscache(inode), page, page->index, page->flags,
inode);
>
>         if (PageChecked(page)) {
> +               dfprintk(FSCACHE, "NFS:    readpage_from_fscache:
PageChecked\n");
>                 ClearPageChecked(page);
>                 return 1;
>         }
>
> -       ret = fscache_read_or_alloc_page(nfs_i_fscache(inode),
> -                                        page,
> -
 nfs_readpage_from_fscache_complete,
> -                                        ctx,
> -                                        GFP_KERNEL);
> +       ret = fscache_fallback_read_page(nfs_i_fscache(inode), page);
> +       if (ret < 0) {
> +               dfprintk(FSCACHE, "NFS:    readpage_from_fscache: "
> +                        "fscache_fallback_read_page failed ret = %d\n",
ret);
> +               return ret;
> +       }
>
>         switch (ret) {
> -       case 0: /* read BIO submitted (page in fscache) */
> +       case 0: /* Read completed synchronously */
>                 dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache: BIO
submitted\n");
> +                        "NFS:    readpage_from_fscache: read
successful\n");
>                 nfs_inc_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_READ_OK);
> -               return ret;
> +               SetPageUptodate(page);
> +               return 0;
>
>         case -ENOBUFS: /* inode not in cache */
>         case -ENODATA: /* page not in cache */
>                 nfs_inc_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_READ_FAIL);
>                 dfprintk(FSCACHE,
>                          "NFS:    readpage_from_fscache %d\n", ret);
> +               SetPageChecked(page);
>                 return 1;
>
>         default:
>                 dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n",
ret);
>                 nfs_inc_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_READ_FAIL);
> +               SetPageChecked(page);
>         }
>         return ret;
>  }


The added "if (ret < 0) ..." renders the bulk of the switch statement with
non-zero cases moot.
I have a patch or two on top of it that cleans this up, and replaces the
dfprintks with tracepoints.
If you want I can try to merge at least bits of it into  a v3 of this
patch, and leave the dfprintk
conversion to tracepoints for another patch.


>
>
> -/*
> - * Retrieve a set of pages from fscache
> - */
> -int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
> -                                struct inode *inode,
> -                                struct address_space *mapping,
> -                                struct list_head *pages,
> -                                unsigned *nr_pages)
> -{
> -       unsigned npages = *nr_pages;
> -       int ret;
> -
> -       dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache
(0x%p/%u/0x%p)\n",
> -                nfs_i_fscache(inode), npages, inode);
> -
> -       ret = fscache_read_or_alloc_pages(nfs_i_fscache(inode),
> -                                         mapping, pages, nr_pages,
> -
nfs_readpage_from_fscache_complete,
> -                                         ctx,
> -                                         mapping_gfp_mask(mapping));
> -       if (*nr_pages < npages)
> -               nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK,
> -                                     npages);
> -       if (*nr_pages > 0)
> -               nfs_add_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_READ_FAIL,
> -                                     *nr_pages);
> -
> -       switch (ret) {
> -       case 0: /* read submitted to the cache for all pages */
> -               BUG_ON(!list_empty(pages));
> -               BUG_ON(*nr_pages != 0);
> -               dfprintk(FSCACHE,
> -                        "NFS: nfs_getpages_from_fscache: submitted\n");
> -
> -               return ret;
> -
> -       case -ENOBUFS: /* some pages aren't cached and can't be */
> -       case -ENODATA: /* some pages aren't cached */
> -               dfprintk(FSCACHE,
> -                        "NFS: nfs_getpages_from_fscache: no page: %d\n",
ret);
> -               return 1;
> -
> -       default:
> -               dfprintk(FSCACHE,
> -                        "NFS: nfs_getpages_from_fscache: ret  %d\n",
ret);
> -       }
> -
> -       return ret;
> -}
> -
>  /*
>   * Store a newly fetched page in fscache
> - * - PG_fscache must be set on the page
>   */
> -void __nfs_readpage_to_fscache(struct inode *inode, struct page *page,
int sync)
> +void __nfs_readpage_to_fscache(struct inode *inode, struct page *page)
>  {
>         int ret;
>
>         dfprintk(FSCACHE,
> -                "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx
f:%lx)/%d)\n",
> -                nfs_i_fscache(inode), page, page->index, page->flags,
sync);
> +                "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx))\n",
> +                nfs_i_fscache(inode), page, page->index, page->flags);
> +
> +       ret = fscache_fallback_write_page(nfs_i_fscache(inode), page);
>
> -       ret = fscache_write_page(nfs_i_fscache(inode), page,
> -                                inode->i_size, GFP_KERNEL);
>         dfprintk(FSCACHE,
>                  "NFS:     readpage_to_fscache: p:%p(i:%lu f:%lx) ret
%d\n",
>                  page, page->index, page->flags, ret);
>
>         if (ret != 0) {
> -               fscache_uncache_page(nfs_i_fscache(inode), page);
> -               nfs_inc_fscache_stats(inode,
> -                                     NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
> +               nfs_inc_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
>                 nfs_inc_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_UNCACHED);
>         } else {
> -               nfs_inc_fscache_stats(inode,
> -                                     NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
> +               nfs_inc_fscache_stats(inode,
NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
>         }
>  }
> diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
> index 6118cdd2e1d7..679055720dae 100644
> --- a/fs/nfs/fscache.h
> +++ b/fs/nfs/fscache.h
> @@ -11,7 +11,7 @@
>  #include <linux/nfs_fs.h>
>  #include <linux/nfs_mount.h>
>  #include <linux/nfs4_mount.h>
> -#define FSCACHE_USE_OLD_IO_API
> +#define FSCACHE_USE_FALLBACK_IO_API
>  #include <linux/fscache.h>
>
>  #ifdef CONFIG_NFS_FSCACHE
> @@ -94,61 +94,19 @@ extern void nfs_fscache_init_inode(struct inode *);
>  extern void nfs_fscache_clear_inode(struct inode *);
>  extern void nfs_fscache_open_file(struct inode *, struct file *);
>
> -extern void __nfs_fscache_invalidate_page(struct page *, struct inode *);
> -extern int nfs_fscache_release_page(struct page *, gfp_t);
> -
> -extern int __nfs_readpage_from_fscache(struct nfs_open_context *,
> -                                      struct inode *, struct page *);
> -extern int __nfs_readpages_from_fscache(struct nfs_open_context *,
> -                                       struct inode *, struct
address_space *,
> -                                       struct list_head *, unsigned *);
> -extern void __nfs_readpage_to_fscache(struct inode *, struct page *,
int);
> -
> -/*
> - * wait for a page to complete writing to the cache
> - */
> -static inline void nfs_fscache_wait_on_page_write(struct nfs_inode *nfsi,
> -                                                 struct page *page)
> -{
> -       if (PageFsCache(page))
> -               fscache_wait_on_page_write(nfsi->fscache, page);
> -}
> -
> -/*
> - * release the caching state associated with a page if undergoing
complete page
> - * invalidation
> - */
> -static inline void nfs_fscache_invalidate_page(struct page *page,
> -                                              struct inode *inode)
> -{
> -       if (PageFsCache(page))
> -               __nfs_fscache_invalidate_page(page, inode);
> -}
> +extern int __nfs_readpage_from_fscache(struct inode *, struct page *);
> +extern void __nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
> +                                            unsigned long bytes);
> +extern void __nfs_readpage_to_fscache(struct inode *, struct page *);
>
>  /*
>   * Retrieve a page from an inode data storage object.
>   */
> -static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
> -                                           struct inode *inode,
> +static inline int nfs_readpage_from_fscache(struct inode *inode,
>                                             struct page *page)
>  {
>         if (NFS_I(inode)->fscache)
> -               return __nfs_readpage_from_fscache(ctx, inode, page);
> -       return -ENOBUFS;
> -}
> -
> -/*
> - * Retrieve a set of pages from an inode data storage object.
> - */
> -static inline int nfs_readpages_from_fscache(struct nfs_open_context
*ctx,
> -                                            struct inode *inode,
> -                                            struct address_space
*mapping,
> -                                            struct list_head *pages,
> -                                            unsigned *nr_pages)
> -{
> -       if (NFS_I(inode)->fscache)
> -               return __nfs_readpages_from_fscache(ctx, inode, mapping,
pages,
> -                                                   nr_pages);
> +               return __nfs_readpage_from_fscache(inode, page);
>         return -ENOBUFS;
>  }
>
> @@ -157,11 +115,10 @@ static inline int nfs_readpages_from_fscache(struct
nfs_open_context *ctx,
>   * in the cache.
>   */
>  static inline void nfs_readpage_to_fscache(struct inode *inode,
> -                                          struct page *page,
> -                                          int sync)
> +                                          struct page *page)
>  {
> -       if (PageFsCache(page))
> -               __nfs_readpage_to_fscache(inode, page, sync);
> +       if (NFS_I(inode)->fscache)
> +               __nfs_readpage_to_fscache(inode, page);
>  }
>
>  /*
> @@ -204,31 +161,13 @@ static inline void nfs_fscache_clear_inode(struct
inode *inode) {}
>  static inline void nfs_fscache_open_file(struct inode *inode,
>                                          struct file *filp) {}
>
> -static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
> -{
> -       return 1; /* True: may release page */
> -}
> -static inline void nfs_fscache_invalidate_page(struct page *page,
> -                                              struct inode *inode) {}
> -static inline void nfs_fscache_wait_on_page_write(struct nfs_inode *nfsi,
> -                                                 struct page *page) {}
> -
> -static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
> -                                           struct inode *inode,
> +static inline int nfs_readpage_from_fscache(struct inode *inode,
>                                             struct page *page)
>  {
>         return -ENOBUFS;
>  }
> -static inline int nfs_readpages_from_fscache(struct nfs_open_context
*ctx,
> -                                            struct inode *inode,
> -                                            struct address_space
*mapping,
> -                                            struct list_head *pages,
> -                                            unsigned *nr_pages)
> -{
> -       return -ENOBUFS;
> -}
>  static inline void nfs_readpage_to_fscache(struct inode *inode,
> -                                          struct page *page, int sync) {}
> +                                          struct page *page) {}
>
>
>  static inline void nfs_fscache_invalidate(struct inode *inode) {}
> diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> index 08d6cc57cbc3..06ed827a67e8 100644
> --- a/fs/nfs/read.c
> +++ b/fs/nfs/read.c
> @@ -123,7 +123,7 @@ static void nfs_readpage_release(struct nfs_page
*req, int error)
>                 struct address_space *mapping = page_file_mapping(page);
>
>                 if (PageUptodate(page))
> -                       nfs_readpage_to_fscache(inode, page, 0);
> +                       nfs_readpage_to_fscache(inode, page);
>                 else if (!PageError(page) && !PagePrivate(page))
>                         generic_error_remove_page(mapping, page);
>                 unlock_page(page);
> @@ -305,6 +305,12 @@ readpage_async_filler(void *data, struct page *page)
>
>         aligned_len = min_t(unsigned int, ALIGN(len, rsize), PAGE_SIZE);
>
> +       if (!IS_SYNC(page->mapping->host)) {
> +               error = nfs_readpage_from_fscache(page->mapping->host,
page);
> +               if (error == 0)
> +                       goto out_unlock;
> +       }
> +
>         new = nfs_create_request(desc->ctx, page, 0, aligned_len);
>         if (IS_ERR(new))
>                 goto out_error;
> @@ -320,6 +326,7 @@ readpage_async_filler(void *data, struct page *page)
>         return 0;
>  out_error:
>         error = PTR_ERR(new);
> +out_unlock:
>         unlock_page(page);
>  out:
>         return error;
> @@ -367,12 +374,6 @@ int nfs_readpage(struct file *file, struct page
*page)
>                 desc.ctx =
get_nfs_open_context(nfs_file_open_context(file));
>
>         xchg(&desc.ctx->error, 0);
> -       if (!IS_SYNC(inode)) {
> -               ret = nfs_readpage_from_fscache(desc.ctx, inode, page);
> -               if (ret == 0)
> -                       goto out_wait;
> -       }
> -
>         nfs_pageio_init_read(&desc.pgio, inode, false,
>                              &nfs_async_read_completion_ops);
>
> @@ -382,7 +383,6 @@ int nfs_readpage(struct file *file, struct page *page)
>
>         nfs_pageio_complete_read(&desc.pgio);
>         ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
> -out_wait:
>         if (!ret) {
>                 ret = wait_on_page_locked_killable(page);
>                 if (!PageUptodate(page) && !ret)
> @@ -421,14 +421,6 @@ int nfs_readpages(struct file *file, struct
address_space *mapping,
>         } else
>                 desc.ctx =
get_nfs_open_context(nfs_file_open_context(file));
>
> -       /* attempt to read as many of the pages as possible from the cache
> -        * - this returns -ENOBUFS immediately if the cookie is negative
> -        */
> -       ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
> -                                        pages, &nr_pages);
> -       if (ret == 0)
> -               goto read_complete; /* all pages were read */
> -
>         nfs_pageio_init_read(&desc.pgio, inode, false,
>                              &nfs_async_read_completion_ops);
>
> @@ -436,7 +428,6 @@ int nfs_readpages(struct file *file, struct
address_space *mapping,
>
>         nfs_pageio_complete_read(&desc.pgio);
>
> -read_complete:
>         put_nfs_open_context(desc.ctx);
>  out:
>         return ret;
> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
> index eae9bf114041..466266a96b2a 100644
> --- a/fs/nfs/write.c
> +++ b/fs/nfs/write.c
> @@ -2124,8 +2124,11 @@ int nfs_migrate_page(struct address_space
*mapping, struct page *newpage,
>         if (PagePrivate(page))
>                 return -EBUSY;
>
> -       if (!nfs_fscache_release_page(page, GFP_KERNEL))
> -               return -EBUSY;
> +       if (PageFsCache(page)) {
> +               if (mode == MIGRATE_ASYNC)
> +                       return -EBUSY;
> +               wait_on_page_fscache(page);
> +       }
>
>         return migrate_page(mapping, newpage, page, mode);
>  }
>
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

