Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D06923BEFF
	for <lists+linux-cachefs@lfdr.de>; Tue,  4 Aug 2020 19:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596563000;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=glU9M8M5KyThAC3HDN5Zi6J+g8yw0YmOm+gTecTVg58=;
	b=YyKdwd89dVVhbhKmUX3NUtM/rf2h0Cb4Qq7W9tg6MOgAV4kza4yVkYgc8Gw8ws3C9Y6Spo
	/zt+D3pO+/ORzYkg4eASNJ85mLYd7pGNTBbNR5hGfG7h62TERq9KGAQaY4p9cXx783+p/P
	cBBABssfWAOvzRzCjysbYO1p/l4EBZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-WSbn2eXGMJKJPQZ2mIz0_A-1; Tue, 04 Aug 2020 13:43:18 -0400
X-MC-Unique: WSbn2eXGMJKJPQZ2mIz0_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85BAA80183C;
	Tue,  4 Aug 2020 17:43:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DEBB60BF3;
	Tue,  4 Aug 2020 17:43:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A696AA35BC;
	Tue,  4 Aug 2020 17:43:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074HfuQ1006731 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 13:41:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20E89110F0AF; Tue,  4 Aug 2020 17:41:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BD70110F0B5
	for <linux-cachefs@redhat.com>; Tue,  4 Aug 2020 17:41:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23990801180
	for <linux-cachefs@redhat.com>; Tue,  4 Aug 2020 17:41:53 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
	[209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-HcoUqbxmP2eQyc9bRk9Fdw-1; Tue, 04 Aug 2020 13:41:51 -0400
X-MC-Unique: HcoUqbxmP2eQyc9bRk9Fdw-1
Received: by mail-ej1-f69.google.com with SMTP id m18so6156417ejl.5
	for <linux-cachefs@redhat.com>; Tue, 04 Aug 2020 10:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BwGhFmxM7Ko6yqu8D2iyqusSc3ZcMHwVTwpHIC7TSn8=;
	b=GycG04zR2b++mUNi0pxQ6cD0mXL8wTPFjYU2+HsoYPX5mBb5mC69mEgZjPcxZ7bsAZ
	urebu0+kFYCk16TfnZylkZkAjg6keOr7kOB5AmI00Klbfi4RBw6Ki+xXV/jDHKlui5Fi
	I6Ho2w4D/iEkbCgBOU/wud9MdZT44BxaQyG6r6kP+YdG2Te3MRB2nPlxkeMeNgmcIs1k
	LxGJdjL5eteX8s/asvuv1+G5KaX6v+OZvFQciPHXGzT1soAdiSXwHJie8E284Lf/tCQ/
	XSr6VAJgP/w/BJooj9///p5RFtKNacCV7AxrkAKSTLlP76vBbHw0m4PHkN65tZxltU28
	n4Ng==
X-Gm-Message-State: AOAM533pYc85J+QM6a4HWTsB/IPyBz9a/lry+Kx87XURfm9mX5/Qqkp0
	eEXlGbQmw7wjBQfQCWsEyoXaJuYTPM67ZHx398s8GWbtIOg5QMSeJw8E+XnzcIo541GtUbBI7JM
	fPqZLPuZDcoUao270xi0f3tVYkC6+RfbaAUBCWw==
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr23922555ejf.83.1596562909295; 
	Tue, 04 Aug 2020 10:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmTHQAZ6MLE0pGelAGIiwoaaDtspxlb8PNcGAR4g4qoD4AYorPOtmemytxPt8IErQ2AQr30bi+fWiP9GA/qMg=
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr23922524ejf.83.1596562908734; 
	Tue, 04 Aug 2020 10:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
	<1596031949-26793-8-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1596031949-26793-8-git-send-email-dwysocha@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 4 Aug 2020 13:41:12 -0400
Message-ID: <CALF+zOn9hes394jTRWep-LcFGHg7kH5d-5ZC2oPC4FbfbsZr5w@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 07/14] NFS: Convert
 nfs_readpage() and readpages() to new fscache API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2020 at 10:12 AM Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> This patch converts the NFS read paths to the new fscache API,
> minimizing changes to the existing code.
>
> The new fscache IO path API uses a different mechanism to read
> through the cache.  There are two main read_helper calls:
> - readpage: fscache_read_helper_locked_page()
>   - replaces old API fscache_read_or_alloc_page()
> - readpages: fscache_read_helper_page_list()
>   - replaces old API fscache_read_or_alloc_pages()
>
> Once submitted to the read_helper, if pages are inside the cache
> fscache will call the done() function of fscache_io_request_ops().
> If the pages are not inside the cache, fscache will call issue_op()
> so NFS can go through its normal read code paths, such as
> nfs_pageio_init_read(), nfs_pageio_add_page_read() and
> nfs_pageio_complete_read().
>
> In the read completion code path, from nfs_read_completion() we
> must call into fscache via a cache.io_done() function.  In order
> to call back into fscache via this function, we must save the
> nfs_fscache_req * as a field in the nfs_pgio_header, similar to
> nfs_direct_req.  Note also that when fscache is enabled, the
> read_helper will lock and unlock the pages so in the completion
> path we skip the unlock_page() with fscache.
>
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
>  fs/nfs/fscache.c         | 217 +++++++++++++++++++++++------------------------
>  fs/nfs/fscache.h         |  30 +++----
>  fs/nfs/pagelist.c        |   1 +
>  fs/nfs/read.c            |  12 ++-
>  include/linux/nfs_page.h |   1 +
>  include/linux/nfs_xdr.h  |   1 +
>  6 files changed, 132 insertions(+), 130 deletions(-)
>
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index a60df88efc40..f641f33fa632 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -328,73 +328,88 @@ void nfs_fscache_open_file(struct inode *inode, struct file *filp)
>  }
>  EXPORT_SYMBOL_GPL(nfs_fscache_open_file);
>
> -/*
> - * Release the caching state associated with a page, if the page isn't busy
> - * interacting with the cache.
> - * - Returns true (can release page) or false (page busy).
> - */
> -int nfs_fscache_release_page(struct page *page, gfp_t gfp)
> -{
> -       if (PageFsCache(page)) {
> -               struct fscache_cookie *cookie = nfs_i_fscache(page->mapping->host);
> -
> -               BUG_ON(!cookie);
> -               dfprintk(FSCACHE, "NFS: fscache releasepage (0x%p/0x%p/0x%p)\n",
> -                        cookie, page, NFS_I(page->mapping->host));
> -
> -               if (!fscache_maybe_release_page(cookie, page, gfp))
> -                       return 0;
> +struct nfs_fscache_req {
> +       struct fscache_io_request       cache;
> +       struct nfs_readdesc             desc;
> +       refcount_t                      usage;
> +};
>
> -               nfs_inc_fscache_stats(page->mapping->host,
> -                                     NFSIOS_FSCACHE_PAGES_UNCACHED);
> -       }
> +static void nfs_done_io_request(struct fscache_io_request *fsreq)
> +{
> +       struct nfs_fscache_req *req = container_of(fsreq, struct nfs_fscache_req, cache);
> +       struct inode *inode = d_inode(req->desc.ctx->dentry);
>
> -       return 1;
> +       nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK,
> +                             fsreq->transferred >> PAGE_SHIFT);
>  }
>
> -/*
> - * Release the caching state associated with a page if undergoing complete page
> - * invalidation.
> - */
> -void __nfs_fscache_invalidate_page(struct page *page, struct inode *inode)
> +static void nfs_get_io_request(struct fscache_io_request *fsreq)
>  {
> -       struct fscache_cookie *cookie = nfs_i_fscache(inode);
> +       struct nfs_fscache_req *req = container_of(fsreq, struct nfs_fscache_req, cache);
>
> -       BUG_ON(!cookie);
> +       refcount_inc(&req->usage);
> +}
>
> -       dfprintk(FSCACHE, "NFS: fscache invalidatepage (0x%p/0x%p/0x%p)\n",
> -                cookie, page, NFS_I(inode));
> +static void nfs_put_io_request(struct fscache_io_request *fsreq)
> +{
> +       struct nfs_fscache_req *req = container_of(fsreq, struct nfs_fscache_req, cache);
>
> -       fscache_wait_on_page_write(cookie, page);
> +       if (refcount_dec_and_test(&req->usage)) {
> +               put_nfs_open_context(req->desc.ctx);
> +               fscache_free_io_request(fsreq);
> +               kfree(req);
> +       }
> +}
>
> -       BUG_ON(!PageLocked(page));
> -       fscache_uncache_page(cookie, page);
> -       nfs_inc_fscache_stats(page->mapping->host,
> -                             NFSIOS_FSCACHE_PAGES_UNCACHED);
> +static void nfs_issue_op(struct fscache_io_request *fsreq)
> +{
> +       struct nfs_fscache_req *req = container_of(fsreq, struct nfs_fscache_req, cache);
> +       struct inode *inode = req->cache.mapping->host;
> +       struct page *page;
> +       pgoff_t index = req->cache.pos >> PAGE_SHIFT;
> +       pgoff_t last = index + req->cache.nr_pages - 1;
> +
> +       nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL,
> +                             req->cache.nr_pages);
> +       nfs_get_io_request(fsreq);
> +       nfs_pageio_init_read(&req->desc.pgio, inode, false,
> +                            &nfs_async_read_completion_ops);
> +
> +       for (; index <= last; index++) {
> +               page = find_get_page(req->cache.mapping, index);
> +               BUG_ON(!page);
> +               req->cache.error = readpage_async_filler(&req->desc, page);
> +               if (req->cache.error < 0)
> +                       break;
> +       }
> +       nfs_pageio_complete_read(&req->desc.pgio, inode);
>  }
>

When testing pnfs, I realize the above is wrong / needs fixed up.
The high-level problem is that xfstest generic/001 panics inside
fscache / mm due to a page either not having PG_fscache set on it,
or a page not having PG_locked.  This is due to NFS calling into fscache
twice to write the same data (see nfs_read_completion_to_fscache)
with essentially the same fscache_io_request.

I think the root is the above code does not handle the
nfs_pageio_descriptor and properly when we hit the following code path:
nfs_issue_op()
  readpage_async_filler()
    nfs_pageio_add_request()
      nfs_pageio_add_request_mirror()
         __nfs_pageio_add_request()
            nfs_pageio_doio()  /* Can't coalesce any more, so do I/O */

I overlooked the above call to nfs_pageio_doio() and erroneously
assumed this was only called via nfs_pageio_complete().

> -/*
> - * Handle completion of a page being read from the cache.
> - * - Called in process (keventd) context.
> - */
> -static void nfs_readpage_from_fscache_complete(struct page *page,
> -                                              void *context,
> -                                              int error)
> +static struct fscache_io_request_ops nfs_fscache_req_ops = {
> +       .issue_op       = nfs_issue_op,
> +       .done           = nfs_done_io_request,
> +       .get            = nfs_get_io_request,
> +       .put            = nfs_put_io_request,
> +};
> +
> +struct nfs_fscache_req *nfs_alloc_io_request(struct nfs_open_context *ctx,
> +                                           struct address_space *mapping)
>  {
> -       dfprintk(FSCACHE,
> -                "NFS: readpage_from_fscache_complete (0x%p/0x%p/%d)\n",
> -                page, context, error);
> -
> -       /* if the read completes with an error, we just unlock the page and let
> -        * the VM reissue the readpage */
> -       if (!error) {
> -               SetPageUptodate(page);
> -               unlock_page(page);
> -       } else {
> -               error = nfs_readpage_async(context, page->mapping->host, page);
> -               if (error)
> -                       unlock_page(page);
> +       struct nfs_fscache_req *req;
> +       struct inode *inode = mapping->host;
> +
> +       req = kzalloc(sizeof(*req), GFP_KERNEL);
> +       if (req) {
> +               refcount_set(&req->usage, 1);
> +               req->cache.mapping = mapping;
> +               req->desc.ctx = get_nfs_open_context(ctx);
> +
> +               fscache_init_io_request(&req->cache, nfs_i_fscache(inode),
> +                                       &nfs_fscache_req_ops);
> +               req->desc.pgio.pg_fsc_req = req;
>         }
> +
> +       return req;
>  }
>
>  /*
> @@ -403,36 +418,38 @@ static void nfs_readpage_from_fscache_complete(struct page *page,
>  int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
>                                 struct inode *inode, struct page *page)
>  {
> +       struct nfs_fscache_req *req;
>         int ret;
>
>         dfprintk(FSCACHE,
>                  "NFS: readpage_from_fscache(fsc:%p/p:%p(i:%lx f:%lx)/0x%p)\n",
>                  nfs_i_fscache(inode), page, page->index, page->flags, inode);
>
> -       ret = fscache_read_or_alloc_page(nfs_i_fscache(inode),
> -                                        page,
> -                                        nfs_readpage_from_fscache_complete,
> -                                        ctx,
> -                                        GFP_KERNEL);
> +       req = nfs_alloc_io_request(ctx, page_file_mapping(page));
> +       if (IS_ERR(req))
> +               return PTR_ERR(req);
> +
> +       ret = fscache_read_helper_locked_page(&req->cache, page, ULONG_MAX);
> +
> +       nfs_put_io_request(&req->cache);
>
>         switch (ret) {
> -       case 0: /* read BIO submitted (page in fscache) */
> -               dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache: BIO submitted\n");
> +       case 0: /* read submitted */
> +               dfprintk(FSCACHE, "NFS:    readpage_from_fscache: submitted\n");
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
>                 return ret;
>
>         case -ENOBUFS: /* inode not in cache */
>         case -ENODATA: /* page not in cache */
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
> -               dfprintk(FSCACHE,
> -                        "NFS:    readpage_from_fscache %d\n", ret);
> +               dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n", ret);
>                 return 1;
>
>         default:
>                 dfprintk(FSCACHE, "NFS:    readpage_from_fscache %d\n", ret);
>                 nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
>         }
> +
>         return ret;
>  }
>
> @@ -442,75 +459,57 @@ int __nfs_readpage_from_fscache(struct nfs_open_context *ctx,
>  int __nfs_readpages_from_fscache(struct nfs_open_context *ctx,
>                                  struct inode *inode,
>                                  struct address_space *mapping,
> -                                struct list_head *pages,
> -                                unsigned *nr_pages)
> +                                struct list_head *pages)
>  {
> -       unsigned npages = *nr_pages;
> +       struct nfs_fscache_req *req;
>         int ret;
>
> -       dfprintk(FSCACHE, "NFS: nfs_getpages_from_fscache (0x%p/%u/0x%p)\n",
> -                nfs_i_fscache(inode), npages, inode);
> -
> -       ret = fscache_read_or_alloc_pages(nfs_i_fscache(inode),
> -                                         mapping, pages, nr_pages,
> -                                         nfs_readpage_from_fscache_complete,
> -                                         ctx,
> -                                         mapping_gfp_mask(mapping));
> -       if (*nr_pages < npages)
> -               nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK,
> -                                     npages);
> -       if (*nr_pages > 0)
> -               nfs_add_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL,
> -                                     *nr_pages);
> +       dfprintk(FSCACHE, "NFS: nfs_readpages_from_fscache (0x%p/0x%p)\n",
> +                nfs_i_fscache(inode), inode);
> +
> +       while (!list_empty(pages)) {
> +               req = nfs_alloc_io_request(ctx, mapping);
> +               if (IS_ERR(req))
> +                       return PTR_ERR(req);
> +
> +               ret = fscache_read_helper_page_list(&req->cache, pages,
> +                                                   ULONG_MAX);
> +               nfs_put_io_request(&req->cache);
> +               if (ret < 0)
> +                       break;
> +       }
>
>         switch (ret) {
>         case 0: /* read submitted to the cache for all pages */
> -               BUG_ON(!list_empty(pages));
> -               BUG_ON(*nr_pages != 0);
>                 dfprintk(FSCACHE,
> -                        "NFS: nfs_getpages_from_fscache: submitted\n");
> +                        "NFS: nfs_readpages_from_fscache: submitted\n");
>
>                 return ret;
>
>         case -ENOBUFS: /* some pages aren't cached and can't be */
>         case -ENODATA: /* some pages aren't cached */
>                 dfprintk(FSCACHE,
> -                        "NFS: nfs_getpages_from_fscache: no page: %d\n", ret);
> +                        "NFS: nfs_readpages_from_fscache: no page: %d\n", ret);
>                 return 1;
>
>         default:
>                 dfprintk(FSCACHE,
> -                        "NFS: nfs_getpages_from_fscache: ret  %d\n", ret);
> +                        "NFS: nfs_readpages_from_fscache: ret  %d\n", ret);
>         }
> -
>         return ret;
>  }
>
>  /*
> - * Store a newly fetched page in fscache
> - * - PG_fscache must be set on the page
> + * Store a newly fetched data in fscache
>   */
> -void __nfs_readpage_to_fscache(struct inode *inode, struct page *page, int sync)
> +void __nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr, unsigned long bytes)
>  {
> -       int ret;
> +       struct nfs_fscache_req *fsc_req = hdr->fsc_req;
>
> -       dfprintk(FSCACHE,
> -                "NFS: readpage_to_fscache(fsc:%p/p:%p(i:%lx f:%lx)/%d)\n",
> -                nfs_i_fscache(inode), page, page->index, page->flags, sync);
> -
> -       ret = fscache_write_page(nfs_i_fscache(inode), page,
> -                                inode->i_size, GFP_KERNEL);
> -       dfprintk(FSCACHE,
> -                "NFS:     readpage_to_fscache: p:%p(i:%lu f:%lx) ret %d\n",
> -                page, page->index, page->flags, ret);
> -
> -       if (ret != 0) {
> -               fscache_uncache_page(nfs_i_fscache(inode), page);
> -               nfs_inc_fscache_stats(inode,
> -                                     NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
> -               nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_UNCACHED);
> -       } else {
> -               nfs_inc_fscache_stats(inode,
> -                                     NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
> +       if (fsc_req && fsc_req->cache.io_done) {
> +               fsc_req->cache.transferred = min_t(long long, bytes, fsc_req->cache.len);
> +               set_bit(FSCACHE_IO_DATA_FROM_SERVER, &fsc_req->cache.flags);
> +               fsc_req->cache.io_done(&fsc_req->cache);
> +               nfs_put_io_request(&fsc_req->cache);
>         }
>  }
> diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
> index 6754c8607230..d61721832838 100644
> --- a/fs/nfs/fscache.h
> +++ b/fs/nfs/fscache.h
> @@ -100,8 +100,9 @@ extern int __nfs_readpage_from_fscache(struct nfs_open_context *,
>                                        struct inode *, struct page *);
>  extern int __nfs_readpages_from_fscache(struct nfs_open_context *,
>                                         struct inode *, struct address_space *,
> -                                       struct list_head *, unsigned *);
> -extern void __nfs_readpage_to_fscache(struct inode *, struct page *, int);
> +                                       struct list_head *);
> +extern void __nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
> +                                            unsigned long bytes);
>
>  /*
>   * wait for a page to complete writing to the cache
> @@ -142,25 +143,22 @@ static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
>  static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
>                                              struct inode *inode,
>                                              struct address_space *mapping,
> -                                            struct list_head *pages,
> -                                            unsigned *nr_pages)
> +                                            struct list_head *pages)
>  {
>         if (NFS_I(inode)->fscache)
> -               return __nfs_readpages_from_fscache(ctx, inode, mapping, pages,
> -                                                   nr_pages);
> +               return __nfs_readpages_from_fscache(ctx, inode, mapping, pages);
>         return -ENOBUFS;
>  }
>
>  /*
> - * Store a page newly fetched from the server in an inode data storage object
> + * Store pages newly fetched from the server in an inode data storage object
>   * in the cache.
>   */
> -static inline void nfs_readpage_to_fscache(struct inode *inode,
> -                                          struct page *page,
> -                                          int sync)
> +static inline void nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
> +                                                 unsigned long bytes)
>  {
> -       if (PageFsCache(page))
> -               __nfs_readpage_to_fscache(inode, page, sync);
> +       if (NFS_I(hdr->inode)->fscache)
> +               __nfs_read_completion_to_fscache(hdr, bytes);
>  }
>
>  /*
> @@ -221,14 +219,12 @@ static inline int nfs_readpage_from_fscache(struct nfs_open_context *ctx,
>  static inline int nfs_readpages_from_fscache(struct nfs_open_context *ctx,
>                                              struct inode *inode,
>                                              struct address_space *mapping,
> -                                            struct list_head *pages,
> -                                            unsigned *nr_pages)
> +                                            struct list_head *pages)
>  {
>         return -ENOBUFS;
>  }
> -static inline void nfs_readpage_to_fscache(struct inode *inode,
> -                                          struct page *page, int sync) {}
> -
> +static inline void nfs_read_completion_to_fscache(struct nfs_pgio_header *hdr,
> +                                                 unsigned long bytes) {}
>
>  static inline void nfs_fscache_invalidate(struct inode *inode) {}
>  static inline void nfs_fscache_wait_on_invalidate(struct inode *inode) {}
> diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> index 6ea4cac41e46..c8073b3667d9 100644
> --- a/fs/nfs/pagelist.c
> +++ b/fs/nfs/pagelist.c
> @@ -52,6 +52,7 @@ void nfs_pgheader_init(struct nfs_pageio_descriptor *desc,
>         hdr->good_bytes = mirror->pg_count;
>         hdr->io_completion = desc->pg_io_completion;
>         hdr->dreq = desc->pg_dreq;
> +       hdr->fsc_req = desc->pg_fsc_req;
>         hdr->release = release;
>         hdr->completion_ops = desc->pg_completion_ops;
>         if (hdr->completion_ops->init_hdr)
> diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> index 13266eda8f60..c92862c83a7f 100644
> --- a/fs/nfs/read.c
> +++ b/fs/nfs/read.c
> @@ -124,10 +124,13 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
>                 struct address_space *mapping = page_file_mapping(page);
>
>                 if (PageUptodate(page))
> -                       nfs_readpage_to_fscache(inode, page, 0);
> +                       ; /* FIXME: review fscache page error handling */
>                 else if (!PageError(page) && !PagePrivate(page))
>                         generic_error_remove_page(mapping, page);
> -               unlock_page(page);
> +               if (nfs_i_fscache(inode))
> +                       put_page(page); /* See nfs_issue_op() */
> +               else
> +                       unlock_page(page);
>         }
>         nfs_release_request(req);
>  }
> @@ -181,6 +184,8 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
>                 nfs_list_remove_request(req);
>                 nfs_readpage_release(req, error);
>         }
> +       /* FIXME: Review error handling before writing to fscache */
> +       nfs_read_completion_to_fscache(hdr, bytes);
>  out:
>         hdr->release(hdr);
>  }
> @@ -415,8 +420,7 @@ int nfs_readpages(struct file *filp, struct address_space *mapping,
>         /* attempt to read as many of the pages as possible from the cache
>          * - this returns -ENOBUFS immediately if the cookie is negative
>          */
> -       ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping,
> -                                        pages, &nr_pages);
> +       ret = nfs_readpages_from_fscache(desc.ctx, inode, mapping, pages);
>         if (ret == 0)
>                 goto read_complete; /* all pages were read */
>
> diff --git a/include/linux/nfs_page.h b/include/linux/nfs_page.h
> index c32c15216da3..cf4b1a62108e 100644
> --- a/include/linux/nfs_page.h
> +++ b/include/linux/nfs_page.h
> @@ -97,6 +97,7 @@ struct nfs_pageio_descriptor {
>         struct pnfs_layout_segment *pg_lseg;
>         struct nfs_io_completion *pg_io_completion;
>         struct nfs_direct_req   *pg_dreq;
> +       struct nfs_fscache_req  *pg_fsc_req; /* fscache req - may be NULL */
>         unsigned int            pg_bsize;       /* default bsize for mirrors */
>
>         u32                     pg_mirror_count;
> diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
> index 5fd0a9ef425f..746548676a51 100644
> --- a/include/linux/nfs_xdr.h
> +++ b/include/linux/nfs_xdr.h
> @@ -1535,6 +1535,7 @@ struct nfs_pgio_header {
>         const struct nfs_rw_ops *rw_ops;
>         struct nfs_io_completion *io_completion;
>         struct nfs_direct_req   *dreq;
> +       struct nfs_fscache_req  *fsc_req;  /* fscache req - may be NULL */
>
>         int                     pnfs_error;
>         int                     error;          /* merge with pnfs_error */
> --
> 1.8.3.1
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-cachefs
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

