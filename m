Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF205A9A88
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Sep 2022 16:39:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662043142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+HB0RrLjt7tFGcEyW7jIjOX3NfXYgZgFSH/gRc2UlfY=;
	b=IEvK4/J5oXk9Kz9+5owWtodfhnAfYTP7brxVgVclyrp7Jn9ULgGVrX9zGNquuBI5jQZYJJ
	qZSoppoB6vpFfHd5bO/HNVgB235HqDS4L65+FtCzWYrQyGYX1nzJ1BuU1Koj4PAuwgH1bi
	vd0GFSGUetKpNCG1Pd17ijLbR5lrbgg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189--qhRhERWOluBw0Bhs-dHNQ-1; Thu, 01 Sep 2022 10:38:59 -0400
X-MC-Unique: -qhRhERWOluBw0Bhs-dHNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A6883C0ED50;
	Thu,  1 Sep 2022 14:38:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D4224C819;
	Thu,  1 Sep 2022 14:38:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A2641942685;
	Thu,  1 Sep 2022 14:38:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A3621946A5E for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 14:37:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BA9E640B40C7; Thu,  1 Sep 2022 14:37:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B67FA40CF8F2
 for <linux-cachefs@redhat.com>; Thu,  1 Sep 2022 14:37:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96D232999B50
 for <linux-cachefs@redhat.com>; Thu,  1 Sep 2022 14:37:57 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-gz4qiK3XNn6D5spQ-RxNRg-1; Thu, 01 Sep 2022 10:37:56 -0400
X-MC-Unique: gz4qiK3XNn6D5spQ-RxNRg-1
Received: by mail-il1-f199.google.com with SMTP id
 a14-20020a921a0e000000b002eb0baeeb1dso9198165ila.16
 for <linux-cachefs@redhat.com>; Thu, 01 Sep 2022 07:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YJU/vQR1EJ3C3IcnNVoCPoODFux2m5Q7JvD1Ec/PfHo=;
 b=HYgTTQDDzCap9wQNbEw/2JiK91Jwuj58ZY8AwdWsIrduMje/xcRDINRVHz2G//Cg7i
 XFYujPXImjY1S5dJDYOx53wRVdmcsa0W1QRDWFktHfWFkUwAdDDZJz0k1r70cXUctErb
 YoF6yqCnOIN9de3eUOr0Zf+KzI+gZZ7ZZrNkv2k+vWtfyher23oEzwKo5mGm0XrUtvZF
 /vPqksER9LBrVGDvshaGkjvy8YosgRi5a7qwpfGziuLYxZLIU/OE5iPM2evxmUHd/tRs
 igQ2jk5hghz1FIGddtutsZtc9GleNGYaa/5HpEz12/T2WgnmxF2t3Z+sr1rE0DG8j4fA
 5zvA==
X-Gm-Message-State: ACgBeo2re97/5FvbnVlmDS6QMK7MOPqkt7uCvDU9oh9/l9BjhWt2m11c
 nvjiPuRs8tsCpPVggYkzXMjxSI97KorlokkjdmQV3tMvSdzcuHQDV6e+EraURq8i9SkiVzalHw2
 eBqnRXWVgK6OxunB1GjBrlVvKpfGbkOOAAdRGaQ==
X-Received: by 2002:a05:6638:13d1:b0:346:dedb:d189 with SMTP id
 i17-20020a05663813d100b00346dedbd189mr17653889jaj.233.1662043075390; 
 Thu, 01 Sep 2022 07:37:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR513llk9iuqWXJITTtxjdQHFhSZVFOtByihlYs8vLz5q3G7MLJH9Jj2A+C/SwFdgTCoSCIS19p1w+OIpw+ZIYw=
X-Received: by 2002:a05:6638:13d1:b0:346:dedb:d189 with SMTP id
 i17-20020a05663813d100b00346dedbd189mr17653873jaj.233.1662043074932; Thu, 01
 Sep 2022 07:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220901004850.1431412-1-dwysocha@redhat.com>
 <20220901004850.1431412-4-dwysocha@redhat.com>
 <9b11abb44b580f4cb99b0758125d0c29360c1a6b.camel@kernel.org>
 <CALF+zO=BktYxwrw9aqt=8vBxS1-9sQ4GzZL5gnyP+r+jUR_8Yg@mail.gmail.com>
In-Reply-To: <CALF+zO=BktYxwrw9aqt=8vBxS1-9sQ4GzZL5gnyP+r+jUR_8Yg@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 1 Sep 2022 10:37:18 -0400
Message-ID: <CALF+zO=iLenkCwdn6XHFQzYTKE2DcM5uakKjH8sVkrFo910Z6Q@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v4 3/3] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-cachefs <linux-cachefs@redhat.com>,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 1, 2022 at 9:38 AM David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Thu, Sep 1, 2022 at 8:45 AM Jeff Layton <jlayton@kernel.org> wrote:
> >
> > On Wed, 2022-08-31 at 20:48 -0400, Dave Wysochanski wrote:
> > > Convert the NFS buffered read code paths to corresponding netfs APIs,
> > > but only when fscache is configured and enabled.
> > >
> > > The netfs API defines struct netfs_request_ops which must be filled
> > > in by the network filesystem.  For NFS, we only need to define 5 of
> > > the functions, the main one being the issue_read() function.
> > > The issue_read() function is called by the netfs layer when a read
> > > cannot be fulfilled locally, and must be sent to the server (either
> > > the cache is not active, or it is active but the data is not available).
> > > Once the read from the server is complete, netfs requires a call to
> > > netfs_subreq_terminated() which conveys either how many bytes were read
> > > successfully, or an error.  Note that issue_read() is called with a
> > > structure, netfs_io_subrequest, which defines the IO requested, and
> > > contains a start and a length (both in bytes), and assumes the underlying
> > > netfs will return a either an error on the whole region, or the number
> > > of bytes successfully read.
> > >
> > > The NFS IO path is page based and the main APIs are the pgio APIs defined
> > > in pagelist.c.  For the pgio APIs, there is no way for the caller to
> > > know how many RPCs will be sent and how the pages will be broken up
> > > into underlying RPCs, each of which will have their own return code.
> > > Thus, NFS needs some way to accommodate the netfs API requirement on
> > > the single response to the whole request, while also minimizing
> > > disruptive changes to the NFS pgio layer.  The approach taken with this
> > > patch is to allocate a small structure for each call to nfs_issue_read()
> > > to keep some accounting information for the outstanding RPCs, as well as
> > > the final error value or the number of bytes successfully read.  The
> > > accounting data is updated inside nfs_netfs_read_initiate(), and
> > > nfs_netfs_read_done(), when a nfs_pgio_header contains a valid pointer
> > > to the data.  Then finally in nfs_read_completion(), call into
> > > nfs_netfs_read_completion() to update the final error value and bytes
> > > read, and check the accounting data to determine whether this is the
> > > final RPC completion.  If this is the last RPC, then call into
> > > netfs_subreq_terminated() with the final error value or the number
> > > of bytes transferred.
> > >
> > > Link: https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/
> > >
> > > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > > ---
> > >  fs/nfs/fscache.c         | 219 +++++++++++++++++++++++----------------
> > >  fs/nfs/fscache.h         |  71 +++++++------
> > >  fs/nfs/inode.c           |   3 +
> > >  fs/nfs/internal.h        |   9 ++
> > >  fs/nfs/pagelist.c        |  14 +++
> > >  fs/nfs/read.c            |  68 ++++++++----
> > >  include/linux/nfs_page.h |   3 +
> > >  include/linux/nfs_xdr.h  |   3 +
> > >  8 files changed, 245 insertions(+), 145 deletions(-)
> > >
> > > diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> > > index a6fc1c8b6644..85f8251a608a 100644
> > > --- a/fs/nfs/fscache.c
> > > +++ b/fs/nfs/fscache.c
> > > @@ -15,6 +15,9 @@
> > >  #include <linux/seq_file.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/iversion.h>
> > > +#include <linux/xarray.h>
> > > +#include <linux/fscache.h>
> > > +#include <linux/netfs.h>
> > >
> > >  #include "internal.h"
> > >  #include "iostat.h"
> > > @@ -235,112 +238,148 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
> > >       fscache_unuse_cookie(cookie, &auxdata, &i_size);
> > >  }
> > >
> > > -/*
> > > - * Fallback page reading interface.
> > > - */
> > > -static int fscache_fallback_read_page(struct inode *inode, struct page *page)
> > > +
> > > +atomic_t nfs_netfs_debug_id;
> > > +static int nfs_netfs_init_request(struct netfs_io_request *rreq, struct file *file)
> > >  {
> > > -     struct netfs_cache_resources cres;
> > > -     struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
> > > -     struct iov_iter iter;
> > > -     struct bio_vec bvec[1];
> > > -     int ret;
> > > -
> > > -     memset(&cres, 0, sizeof(cres));
> > > -     bvec[0].bv_page         = page;
> > > -     bvec[0].bv_offset       = 0;
> > > -     bvec[0].bv_len          = PAGE_SIZE;
> > > -     iov_iter_bvec(&iter, READ, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
> > > -
> > > -     ret = fscache_begin_read_operation(&cres, cookie);
> > > -     if (ret < 0)
> > > -             return ret;
> > > -
> > > -     ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
> > > -                        NULL, NULL);
> > > -     fscache_end_operation(&cres);
> > > -     return ret;
> > > +     rreq->netfs_priv = get_nfs_open_context(nfs_file_open_context(file));
> > > +
> > > +     if (netfs_i_cookie(&NFS_I(rreq->inode)->netfs))
> > > +             rreq->debug_id = atomic_inc_return(&nfs_netfs_debug_id);
> > > +
> > > +     return 0;
> > >  }
> > >
> > > -/*
> > > - * Fallback page writing interface.
> > > - */
> > > -static int fscache_fallback_write_page(struct inode *inode, struct page *page,
> > > -                                    bool no_space_allocated_yet)
> > > +static void nfs_netfs_free_request(struct netfs_io_request *rreq)
> > >  {
> > > -     struct netfs_cache_resources cres;
> > > -     struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
> > > -     struct iov_iter iter;
> > > -     struct bio_vec bvec[1];
> > > -     loff_t start = page_offset(page);
> > > -     size_t len = PAGE_SIZE;
> > > -     int ret;
> > > -
> > > -     memset(&cres, 0, sizeof(cres));
> > > -     bvec[0].bv_page         = page;
> > > -     bvec[0].bv_offset       = 0;
> > > -     bvec[0].bv_len          = PAGE_SIZE;
> > > -     iov_iter_bvec(&iter, WRITE, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
> > > -
> > > -     ret = fscache_begin_write_operation(&cres, cookie);
> > > -     if (ret < 0)
> > > -             return ret;
> > > -
> > > -     ret = cres.ops->prepare_write(&cres, &start, &len, i_size_read(inode),
> > > -                                   no_space_allocated_yet);
> > > -     if (ret == 0)
> > > -             ret = fscache_write(&cres, page_offset(page), &iter, NULL, NULL);
> > > -     fscache_end_operation(&cres);
> > > -     return ret;
> > > +     put_nfs_open_context(rreq->netfs_priv);
> > >  }
> > >
> > > -/*
> > > - * Retrieve a page from fscache
> > > - */
> > > -int __nfs_fscache_read_page(struct inode *inode, struct page *page)
> > > +static inline int nfs_netfs_begin_cache_operation(struct netfs_io_request *rreq)
> > >  {
> > > -     int ret;
> > > +     return fscache_begin_read_operation(&rreq->cache_resources,
> > > +                                         netfs_i_cookie(&NFS_I(rreq->inode)->netfs));
> > > +}
> > >
> > > -     trace_nfs_fscache_read_page(inode, page);
> > > -     if (PageChecked(page)) {
> > > -             ClearPageChecked(page);
> > > -             ret = 1;
> > > -             goto out;
> > > -     }
> > > +static struct nfs_netfs_io_data *nfs_netfs_alloc(struct netfs_io_subrequest *sreq)
> > > +{
> > > +     struct nfs_netfs_io_data *netfs;
> > > +
> > > +     netfs = kzalloc(sizeof(*netfs), GFP_KERNEL_ACCOUNT);
> > > +     if (!netfs)
> > > +             return NULL;
> > > +     netfs->sreq = sreq;
> > > +     refcount_set(&netfs->refcount, 1);
> > > +     spin_lock_init(&netfs->lock);
> > > +     return netfs;
> > > +}
> > >
> > > -     ret = fscache_fallback_read_page(inode, page);
> > > -     if (ret < 0) {
> > > -             nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_FAIL);
> > > -             SetPageChecked(page);
> > > -             goto out;
> > > +static bool nfs_netfs_clamp_length(struct netfs_io_subrequest *sreq)
> > > +{
> > > +     size_t  rsize = NFS_SB(sreq->rreq->inode->i_sb)->rsize;
> > > +
> > > +     sreq->len = min(sreq->len, rsize);
> > > +     return true;
> > > +}
> > > +
> > > +static void nfs_netfs_issue_read(struct netfs_io_subrequest *sreq)
> > > +{
> > > +     struct nfs_pageio_descriptor pgio;
> > > +     struct inode *inode = sreq->rreq->inode;
> > > +     struct nfs_open_context *ctx = sreq->rreq->netfs_priv;
> > > +     struct page *page;
> > > +     int err;
> > > +     pgoff_t start = (sreq->start + sreq->transferred) >> PAGE_SHIFT;
> > > +     pgoff_t last = ((sreq->start + sreq->len -
> > > +                      sreq->transferred - 1) >> PAGE_SHIFT);
> > > +     XA_STATE(xas, &sreq->rreq->mapping->i_pages, start);
> > > +
> > > +     nfs_pageio_init_read(&pgio, inode, false,
> > > +                          &nfs_async_read_completion_ops);
> > > +
> > > +     pgio.pg_netfs = nfs_netfs_alloc(sreq); /* used in completion */
> > > +     if (!pgio.pg_netfs)
> > > +             return netfs_subreq_terminated(sreq, -ENOMEM, false);
> > > +
> > > +     xas_lock(&xas);
> > > +     xas_for_each(&xas, page, last) {
> > > +             /* nfs_pageio_add_page() may schedule() due to pNFS layout and other RPCs  */
> > > +             xas_pause(&xas);
> > > +             xas_unlock(&xas);
> > > +             err = nfs_pageio_add_page(&pgio, ctx, page);
> > > +             if (err < 0)
> > > +                     return netfs_subreq_terminated(sreq, err, false);
> > > +             xas_lock(&xas);
> > >       }
> > > +     xas_unlock(&xas);
> > > +     nfs_pageio_complete_read(&pgio);
> > > +     nfs_netfs_put(pgio.pg_netfs);
> > > +}
> > >
> > > -     /* Read completed synchronously */
> > > -     nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_READ_OK);
> > > -     SetPageUptodate(page);
> > > -     ret = 0;
> > > -out:
> > > -     trace_nfs_fscache_read_page_exit(inode, page, ret);
> > > -     return ret;
> > > +void nfs_netfs_read_initiate(struct nfs_pgio_header *hdr)
> > > +{
> > > +     struct nfs_netfs_io_data        *netfs = hdr->netfs;
> > > +
> > > +     if (!netfs)
> > > +             return;
> > > +
> > > +     spin_lock(&netfs->lock);
> > > +     atomic_inc(&netfs->rpcs);
> > > +     netfs->rpc_byte_count += hdr->args.count;
> > > +     spin_unlock(&netfs->lock);
> > >  }
> > >
> > > -/*
> > > - * Store a newly fetched page in fscache.  We can be certain there's no page
> > > - * stored in the cache as yet otherwise we would've read it from there.
> > > - */
> > > -void __nfs_fscache_write_page(struct inode *inode, struct page *page)
> > > +void nfs_netfs_read_done(struct nfs_pgio_header *hdr)
> > >  {
> > > -     int ret;
> > > +     struct nfs_netfs_io_data        *netfs = hdr->netfs;
> > >
> > > -     trace_nfs_fscache_write_page(inode, page);
> > > +     if (!netfs)
> > > +             return;
> > > +
> > > +     spin_lock(&netfs->lock);
> > > +     if (hdr->res.op_status) {
> > > +             /*
> > > +              * Retryable errors such as BAD_STATEID will be re-issued,
> > > +              * so reduce the bytes and the RPC counts.
> > > +              */
> > > +             netfs->rpc_byte_count -= hdr->args.count;
> > > +             atomic_dec(&netfs->rpcs);
> > > +     }
> > > +     spin_unlock(&netfs->lock);
> > > +}
> > > +
> > > +void nfs_netfs_read_completion(struct nfs_pgio_header *hdr)
> > > +{
> > > +     struct nfs_netfs_io_data        *netfs = hdr->netfs;
> > > +     struct netfs_io_subrequest      *sreq;
> > > +
> > > +     if (!netfs)
> > > +             return;
> > >
> > > -     ret = fscache_fallback_write_page(inode, page, true);
> > > +     sreq = netfs->sreq;
> > > +     if (test_bit(NFS_IOHDR_EOF, &hdr->flags))
> > > +             __set_bit(NETFS_SREQ_CLEAR_TAIL, &sreq->flags);
> > >
> > > -     if (ret != 0) {
> > > -             nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_FAIL);
> > > -             nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_UNCACHED);
> > > -     } else {
> > > -             nfs_inc_fscache_stats(inode, NFSIOS_FSCACHE_PAGES_WRITTEN_OK);
> > > +     spin_lock(&netfs->lock);
> > > +     if (hdr->error)
> > > +             netfs->error = hdr->error;
> > > +     else
> > > +             netfs->transferred += hdr->res.count;
> > > +     spin_unlock(&netfs->lock);
> > > +
> > > +     /* Only the last RPC completion should call netfs_subreq_terminated() */
> > > +     if (atomic_dec_and_test(&netfs->rpcs) &&
> > > +         (netfs->rpc_byte_count >= sreq->len)) {
> >
> > I don't quite understand the point of the rpc_byte_count. I guess this
> > starts out being a total of the requested bytes in the read, and we
> > decrement the number of bytes in the replies.
> >
> > This should always be a value that is equal to or larger than the
> > sreq->len. Why is it necessary to track that, instead of just the number
> > of RPCs?
> >
>
> As far as I know there's nothing stopping the count of RPCs from going to 0
> before you end up sending all the RPCs.
>
> Example:  Suppose for a single netfs subreq you can get two NFS
> RPCs that both need to complete before the netfs subreq completes.
> As far as I know you could get the scenario of:
> send RPC1 (rpcs == 1)
> receive RPC1 (rpcs == 0)
> send RPC2
> receive RPC2
>
>

I thought of an alternative to the rpc_byte_count but did not implement it.

I'm pretty sure I could have a flag that indicated all RPCs had been sent,
and set this at the bottom of nfs_netfs_issue_read().  Then the logic gating
the call to netfs_subreq_terminated() would become:

if ((netfs->all_rpcs_sent && atomic_dec_and_test(&netfs->rpcs))

Would that be clearer/cleaner?


>
> > > +             netfs_subreq_terminated(sreq, netfs->error ?: netfs->transferred, false);
> > > +             nfs_netfs_put(netfs);
> > > +             hdr->netfs = NULL;
> > >       }
> > > -     trace_nfs_fscache_write_page_exit(inode, page, ret);
> > >  }
> > > +
> > > +const struct netfs_request_ops nfs_netfs_ops = {
> > > +     .init_request           = nfs_netfs_init_request,
> > > +     .free_request           = nfs_netfs_free_request,
> > > +     .begin_cache_operation  = nfs_netfs_begin_cache_operation,
> > > +     .issue_read             = nfs_netfs_issue_read,
> > > +     .clamp_length           = nfs_netfs_clamp_length
> > > +};
> > > diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
> > > index 38614ed8f951..c59a82a7d4a8 100644
> > > --- a/fs/nfs/fscache.h
> > > +++ b/fs/nfs/fscache.h
> > > @@ -34,6 +34,44 @@ struct nfs_fscache_inode_auxdata {
> > >       u64     change_attr;
> > >  };
> > >
> > > +struct nfs_netfs_io_data {
> > > +     refcount_t                      refcount;
> > > +     struct netfs_io_subrequest      *sreq;
> > > +
> > > +     /*
> > > +      * NFS may split a netfs_io_subrequest into multiple RPCs, each
> > > +      * with their own read completion.  In netfs, we can only call
> > > +      * netfs_subreq_terminated() once for each subrequest.  So we
> > > +      * must keep track of the rpcs and rpc_byte_count for what has
> > > +      * been submitted, and only call netfs via netfs_subreq_terminated()
> > > +      * when the final RPC has completed.
> > > +      */
> > > +     atomic_t        rpcs;
> > > +     unsigned long   rpc_byte_count;
> > > +
> > > +     /*
> > > +      * Final dispostion of the netfs_io_subrequest, sent in
> > > +      * netfs_subreq_terminated()
> > > +      */
> > > +     spinlock_t      lock;
> > > +     ssize_t         transferred;
> > > +     int             error;
> > > +};
> > > +
> > > +static inline void nfs_netfs_get(struct nfs_netfs_io_data *netfs)
> > > +{
> > > +     refcount_inc(&netfs->refcount);
> > > +}
> > > +
> > > +static inline void nfs_netfs_put(struct nfs_netfs_io_data *netfs)
> > > +{
> > > +     if (refcount_dec_and_test(&netfs->refcount))
> > > +             kfree(netfs);
> > > +}
> > > +extern void nfs_netfs_read_initiate(struct nfs_pgio_header *hdr);
> > > +extern void nfs_netfs_read_done(struct nfs_pgio_header *hdr);
> > > +extern void nfs_netfs_read_completion(struct nfs_pgio_header *hdr);
> > > +
> > >  /*
> > >   * fscache.c
> > >   */
> > > @@ -45,43 +83,17 @@ extern void nfs_fscache_clear_inode(struct inode *);
> > >  extern void nfs_fscache_open_file(struct inode *, struct file *);
> > >  extern void nfs_fscache_release_file(struct inode *, struct file *);
> > >
> > > -extern int __nfs_fscache_read_page(struct inode *, struct page *);
> > > -extern void __nfs_fscache_write_page(struct inode *, struct page *);
> > > -
> > >  static inline bool nfs_fscache_release_folio(struct folio *folio, gfp_t gfp)
> > >  {
> > >       if (folio_test_fscache(folio)) {
> > >               if (current_is_kswapd() || !(gfp & __GFP_FS))
> > >                       return false;
> > >               folio_wait_fscache(folio);
> > > -             fscache_note_page_release(netfs_i_cookie(&NFS_I(folio->mapping->host)->netfs));
> > > -             nfs_inc_fscache_stats(folio->mapping->host,
> > > -                                   NFSIOS_FSCACHE_PAGES_UNCACHED);
> > >       }
> > > +     fscache_note_page_release(netfs_i_cookie(&NFS_I(folio->mapping->host)->netfs));
> > >       return true;
> > >  }
> > >
> > > -/*
> > > - * Retrieve a page from an inode data storage object.
> > > - */
> > > -static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
> > > -{
> > > -     if (netfs_inode(inode)->cache)
> > > -             return __nfs_fscache_read_page(inode, page);
> > > -     return -ENOBUFS;
> > > -}
> > > -
> > > -/*
> > > - * Store a page newly fetched from the server in an inode data storage object
> > > - * in the cache.
> > > - */
> > > -static inline void nfs_fscache_write_page(struct inode *inode,
> > > -                                        struct page *page)
> > > -{
> > > -     if (netfs_inode(inode)->cache)
> > > -             __nfs_fscache_write_page(inode, page);
> > > -}
> > > -
> > >  static inline void nfs_fscache_update_auxdata(struct nfs_fscache_inode_auxdata *auxdata,
> > >                                             struct inode *inode)
> > >  {
> > > @@ -130,11 +142,6 @@ static inline bool nfs_fscache_release_folio(struct folio *folio, gfp_t gfp)
> > >  {
> > >       return true; /* may release folio */
> > >  }
> > > -static inline int nfs_fscache_read_page(struct inode *inode, struct page *page)
> > > -{
> > > -     return -ENOBUFS;
> > > -}
> > > -static inline void nfs_fscache_write_page(struct inode *inode, struct page *page) {}
> > >  static inline void nfs_fscache_invalidate(struct inode *inode, int flags) {}
> > >
> > >  static inline const char *nfs_server_fscache_state(struct nfs_server *server)
> > > diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> > > index aa2aec785ab5..a0af3518d8db 100644
> > > --- a/fs/nfs/inode.c
> > > +++ b/fs/nfs/inode.c
> > > @@ -2248,6 +2248,9 @@ struct inode *nfs_alloc_inode(struct super_block *sb)
> > >  #endif /* CONFIG_NFS_V4 */
> > >  #ifdef CONFIG_NFS_V4_2
> > >       nfsi->xattr_cache = NULL;
> > > +#endif
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     netfs_inode_init(&nfsi->netfs, &nfs_netfs_ops);
> > >  #endif
> > >       return VFS_I(nfsi);
> > >  }
> > > diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> > > index 273687082992..e5589036c1f8 100644
> > > --- a/fs/nfs/internal.h
> > > +++ b/fs/nfs/internal.h
> > > @@ -453,6 +453,10 @@ extern void nfs_sb_deactive(struct super_block *sb);
> > >  extern int nfs_client_for_each_server(struct nfs_client *clp,
> > >                                     int (*fn)(struct nfs_server *, void *),
> > >                                     void *data);
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +extern const struct netfs_request_ops nfs_netfs_ops;
> > > +#endif
> > > +
> > >  /* io.c */
> > >  extern void nfs_start_io_read(struct inode *inode);
> > >  extern void nfs_end_io_read(struct inode *inode);
> > > @@ -482,9 +486,14 @@ extern int nfs4_get_rootfh(struct nfs_server *server, struct nfs_fh *mntfh, bool
> > >
> > >  struct nfs_pgio_completion_ops;
> > >  /* read.c */
> > > +extern const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
> > >  extern void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
> > >                       struct inode *inode, bool force_mds,
> > >                       const struct nfs_pgio_completion_ops *compl_ops);
> > > +extern int nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
> > > +                            struct nfs_open_context *ctx,
> > > +                            struct page *page);
> > > +extern void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio);
> > >  extern void nfs_read_prepare(struct rpc_task *task, void *calldata);
> > >  extern void nfs_pageio_reset_read_mds(struct nfs_pageio_descriptor *pgio);
> > >
> > > diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> > > index 317cedfa52bf..600989332a6f 100644
> > > --- a/fs/nfs/pagelist.c
> > > +++ b/fs/nfs/pagelist.c
> > > @@ -25,6 +25,7 @@
> > >  #include "internal.h"
> > >  #include "pnfs.h"
> > >  #include "nfstrace.h"
> > > +#include "fscache.h"
> > >
> > >  #define NFSDBG_FACILITY              NFSDBG_PAGECACHE
> > >
> > > @@ -68,6 +69,12 @@ void nfs_pgheader_init(struct nfs_pageio_descriptor *desc,
> > >       hdr->good_bytes = mirror->pg_count;
> > >       hdr->io_completion = desc->pg_io_completion;
> > >       hdr->dreq = desc->pg_dreq;
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     if (desc->pg_netfs) {
> > > +             hdr->netfs = desc->pg_netfs;
> > > +             nfs_netfs_get(desc->pg_netfs);
> > > +     }
> > > +#endif
> > >       hdr->release = release;
> > >       hdr->completion_ops = desc->pg_completion_ops;
> > >       if (hdr->completion_ops->init_hdr)
> > > @@ -846,6 +853,9 @@ void nfs_pageio_init(struct nfs_pageio_descriptor *desc,
> > >       desc->pg_lseg = NULL;
> > >       desc->pg_io_completion = NULL;
> > >       desc->pg_dreq = NULL;
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     desc->pg_netfs = NULL;
> > > +#endif
> > >       desc->pg_bsize = bsize;
> > >
> > >       desc->pg_mirror_count = 1;
> > > @@ -940,6 +950,7 @@ int nfs_generic_pgio(struct nfs_pageio_descriptor *desc,
> > >       /* Set up the argument struct */
> > >       nfs_pgio_rpcsetup(hdr, mirror->pg_count, desc->pg_ioflags, &cinfo);
> > >       desc->pg_rpc_callops = &nfs_pgio_common_ops;
> > > +
> > >       return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(nfs_generic_pgio);
> > > @@ -1360,6 +1371,9 @@ int nfs_pageio_resend(struct nfs_pageio_descriptor *desc,
> > >
> > >       desc->pg_io_completion = hdr->io_completion;
> > >       desc->pg_dreq = hdr->dreq;
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     desc->pg_netfs = hdr->netfs;
> > > +#endif
> > >       list_splice_init(&hdr->pages, &pages);
> > >       while (!list_empty(&pages)) {
> > >               struct nfs_page *req = nfs_list_entry(pages.next);
> > > diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> > > index 525e82ea9a9e..3bc48472f207 100644
> > > --- a/fs/nfs/read.c
> > > +++ b/fs/nfs/read.c
> > > @@ -30,7 +30,7 @@
> > >
> > >  #define NFSDBG_FACILITY              NFSDBG_PAGECACHE
> > >
> > > -static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
> > > +const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
> > >  static const struct nfs_rw_ops nfs_rw_read_ops;
> > >
> > >  static struct kmem_cache *nfs_rdata_cachep;
> > > @@ -74,7 +74,7 @@ void nfs_pageio_init_read(struct nfs_pageio_descriptor *pgio,
> > >  }
> > >  EXPORT_SYMBOL_GPL(nfs_pageio_init_read);
> > >
> > > -static void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio)
> > > +void nfs_pageio_complete_read(struct nfs_pageio_descriptor *pgio)
> > >  {
> > >       struct nfs_pgio_mirror *pgm;
> > >       unsigned long npages;
> > > @@ -110,20 +110,25 @@ EXPORT_SYMBOL_GPL(nfs_pageio_reset_read_mds);
> > >
> > >  static void nfs_readpage_release(struct nfs_page *req, int error)
> > >  {
> > > -     struct inode *inode = d_inode(nfs_req_openctx(req)->dentry);
> > >       struct page *page = req->wb_page;
> > >
> > > -     dprintk("NFS: read done (%s/%llu %d@%lld)\n", inode->i_sb->s_id,
> > > -             (unsigned long long)NFS_FILEID(inode), req->wb_bytes,
> > > -             (long long)req_offset(req));
> > > -
> > >       if (nfs_error_is_fatal_on_server(error) && error != -ETIMEDOUT)
> > >               SetPageError(page);
> > >       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE)) {
> > > -             if (PageUptodate(page))
> > > -                     nfs_fscache_write_page(inode, page);
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +             struct inode *inode = d_inode(nfs_req_openctx(req)->dentry);
> > > +
> > > +             /*
> > > +              * If fscache is enabled, netfs will unlock pages.
> > > +              * Otherwise, we have to unlock the page here
> > > +              */
> > > +             if (!netfs_inode(inode)->cache)
> > > +                     unlock_page(page);
> > > +#else
> > >               unlock_page(page);
> > > +#endif
> > >       }
> > > +
> > >       nfs_release_request(req);
> > >  }
> > >
> > > @@ -177,6 +182,10 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
> > >               nfs_list_remove_request(req);
> > >               nfs_readpage_release(req, error);
> > >       }
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     nfs_netfs_read_completion(hdr);
> > > +#endif
> > > +
> > >  out:
> > >       hdr->release(hdr);
> > >  }
> > > @@ -187,6 +196,9 @@ static void nfs_initiate_read(struct nfs_pgio_header *hdr,
> > >                             struct rpc_task_setup *task_setup_data, int how)
> > >  {
> > >       rpc_ops->read_setup(hdr, msg);
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     nfs_netfs_read_initiate(hdr);
> > > +#endif
> > >       trace_nfs_initiate_read(hdr);
> > >  }
> > >
> > > @@ -202,7 +214,7 @@ nfs_async_read_error(struct list_head *head, int error)
> > >       }
> > >  }
> > >
> > > -static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops = {
> > > +const struct nfs_pgio_completion_ops nfs_async_read_completion_ops = {
> > >       .error_cleanup = nfs_async_read_error,
> > >       .completion = nfs_read_completion,
> > >  };
> > > @@ -219,6 +231,9 @@ static int nfs_readpage_done(struct rpc_task *task,
> > >       if (status != 0)
> > >               return status;
> > >
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     nfs_netfs_read_done(hdr);
> > > +#endif
> > >       nfs_add_stats(inode, NFSIOS_SERVERREADBYTES, hdr->res.count);
> > >       trace_nfs_readpage_done(task, hdr);
> > >
> > > @@ -294,12 +309,6 @@ nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
> > >
> > >       aligned_len = min_t(unsigned int, ALIGN(len, rsize), PAGE_SIZE);
> > >
> > > -     if (!IS_SYNC(page->mapping->host)) {
> > > -             error = nfs_fscache_read_page(page->mapping->host, page);
> > > -             if (error == 0)
> > > -                     goto out_unlock;
> > > -     }
> > > -
> > >       new = nfs_create_request(ctx, page, 0, aligned_len);
> > >       if (IS_ERR(new))
> > >               goto out_error;
> > > @@ -315,8 +324,6 @@ nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
> > >       return 0;
> > >  out_error:
> > >       error = PTR_ERR(new);
> > > -out_unlock:
> > > -     unlock_page(page);
> > >  out:
> > >       return error;
> > >  }
> > > @@ -355,6 +362,12 @@ int nfs_read_folio(struct file *file, struct folio *folio)
> > >       if (NFS_STALE(inode))
> > >               goto out_unlock;
> > >
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     if (netfs_inode(inode)->cache) {
> > > +             ret = netfs_read_folio(file, folio);
> > > +             goto out;
> > > +     }
> > > +#endif
> > >       if (file == NULL) {
> > >               ret = -EBADF;
> > >               ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> > > @@ -368,8 +381,10 @@ int nfs_read_folio(struct file *file, struct folio *folio)
> > >                            &nfs_async_read_completion_ops);
> > >
> > >       ret = nfs_pageio_add_page(&pgio, ctx, page);
> > > -     if (ret)
> > > -             goto out;
> > > +     if (ret) {
> > > +             put_nfs_open_context(ctx);
> > > +             goto out_unlock;
> > > +     }
> > >
> > >       nfs_pageio_complete_read(&pgio);
> > >       ret = pgio.pg_error < 0 ? pgio.pg_error : 0;
> > > @@ -378,12 +393,12 @@ int nfs_read_folio(struct file *file, struct folio *folio)
> > >               if (!PageUptodate(page) && !ret)
> > >                       ret = xchg(&ctx->error, 0);
> > >       }
> > > -out:
> > >       put_nfs_open_context(ctx);
> > > -     trace_nfs_aop_readpage_done(inode, page, ret);
> > > -     return ret;
> > > +     goto out;
> > > +
> > >  out_unlock:
> > >       unlock_page(page);
> > > +out:
> > >       trace_nfs_aop_readpage_done(inode, page, ret);
> > >       return ret;
> > >  }
> > > @@ -405,6 +420,13 @@ void nfs_readahead(struct readahead_control *ractl)
> > >       if (NFS_STALE(inode))
> > >               goto out;
> > >
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     if (netfs_inode(inode)->cache) {
> > > +             netfs_readahead(ractl);
> > > +             ret = 0;
> > > +             goto out;
> > > +     }
> > > +#endif
> > >       if (file == NULL) {
> > >               ret = -EBADF;
> > >               ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> > > diff --git a/include/linux/nfs_page.h b/include/linux/nfs_page.h
> > > index ba7e2e4b0926..8eeb16d9bacd 100644
> > > --- a/include/linux/nfs_page.h
> > > +++ b/include/linux/nfs_page.h
> > > @@ -101,6 +101,9 @@ struct nfs_pageio_descriptor {
> > >       struct pnfs_layout_segment *pg_lseg;
> > >       struct nfs_io_completion *pg_io_completion;
> > >       struct nfs_direct_req   *pg_dreq;
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     void                    *pg_netfs;
> > > +#endif
> > >       unsigned int            pg_bsize;       /* default bsize for mirrors */
> > >
> > >       u32                     pg_mirror_count;
> > > diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
> > > index e86cf6642d21..e196ef595908 100644
> > > --- a/include/linux/nfs_xdr.h
> > > +++ b/include/linux/nfs_xdr.h
> > > @@ -1619,6 +1619,9 @@ struct nfs_pgio_header {
> > >       const struct nfs_rw_ops *rw_ops;
> > >       struct nfs_io_completion *io_completion;
> > >       struct nfs_direct_req   *dreq;
> > > +#ifdef CONFIG_NFS_FSCACHE
> > > +     void                    *netfs;
> > > +#endif
> > >
> > >       int                     pnfs_error;
> > >       int                     error;          /* merge with pnfs_error */
> >
> > --
> > Jeff Layton <jlayton@kernel.org>
> >

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

