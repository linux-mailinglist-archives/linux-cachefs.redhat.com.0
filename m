Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177D51E633
	for <lists+linux-cachefs@lfdr.de>; Sat,  7 May 2022 11:48:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-hhh4-uNkOWq9kgGnavSjCQ-1; Sat, 07 May 2022 05:48:31 -0400
X-MC-Unique: hhh4-uNkOWq9kgGnavSjCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00461802819;
	Sat,  7 May 2022 09:48:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7CEBC27EAA;
	Sat,  7 May 2022 09:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABD731947060;
	Sat,  7 May 2022 09:48:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D7C01947058 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  7 May 2022 09:48:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20C75111DCFE; Sat,  7 May 2022 09:48:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C16B111DCF2
 for <linux-cachefs@redhat.com>; Sat,  7 May 2022 09:48:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F8B296A604
 for <linux-cachefs@redhat.com>; Sat,  7 May 2022 09:48:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-jqZxzKZWNkSqX-HMip_zqA-1; Sat, 07 May 2022 05:48:19 -0400
X-MC-Unique: jqZxzKZWNkSqX-HMip_zqA-1
Received: by mail-lj1-f179.google.com with SMTP id y19so11790418ljd.4
 for <linux-cachefs@redhat.com>; Sat, 07 May 2022 02:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pardkw1yfa9EggKNsSn4UDs16CzAj9Cvn55wG3tN6fM=;
 b=M1Hx4gCV1QloNOCqQmFHhcwH+zmmO2y97lrblBG6wDaffuQ22EllsHKg5TfmDmRcmi
 fO9LJYo44DRF24CeM25ajMMv294Xrza6qXfRsmYumhECwxXyCrxa1BM1O/XaI1wVNeUf
 rDSvp1Un/KJKvyFgWy+SHmKsN3pdKXD8keo8fAU48Yvbom+i4FyS09PSat3bvlL8hoW+
 X0JaQDBLuCM10ZEcp71GqzASiUx0+fj4Qh17agX1IdRzHCHvmsSB47v9uSI99fi4lhH5
 DPCUcEOKTd0UfWs9gdgb3bTNsNvpUDJkGNG1Dj7RvOl/92BEq1v9/w/LjaXjfygRftgk
 h7LA==
X-Gm-Message-State: AOAM533IfKj+K2nLwdFyNI2c2T49bGV0KqSqfkHsL1/T72iTadEu4P+2
 t6Bw+aqEoKOIMn8sRtYz0YrViaT74sYkveO4XtgUQg==
X-Google-Smtp-Source: ABdhPJxbNK7UtlGvrA33YmIkpYnB1BKZsHUteRhguLLY+BxsYchtpAh/c5sJvS5k3nl7/ESVZqw/EsloWra96Fdw6o4=
X-Received: by 2002:a05:651c:4d2:b0:250:69a8:5850 with SMTP id
 e18-20020a05651c04d200b0025069a85850mr4777945lji.5.1651916898105; Sat, 07 May
 2022 02:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220507044809.16129-1-yinxin.x@bytedance.com>
 <85cbe786-c701-a298-0fd3-77559fce1037@linux.alibaba.com>
In-Reply-To: <85cbe786-c701-a298-0fd3-77559fce1037@linux.alibaba.com>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Sat, 7 May 2022 17:48:06 +0800
Message-ID: <CAK896s4CWRXO3016xM-1dgfD+on+92_y3Do8zi5K0G-8fhr05w@mail.gmail.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [External] Re: [PATCH] erofs: change to use
 asyncronous io for fscache readpage/readahead
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
Cc: linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 7, 2022 at 5:25 PM JeffleXu <jefflexu@linux.alibaba.com> wrote:
>
> Hi Xin,
>
> On 5/7/22 12:48 PM, Xin Yin wrote:
> > Use asyncronous io to read data from fscache may greatly improve IO
> > bandwidth for sequential buffer read scenario.
> >
> > Change erofs_fscache_read_folios to erofs_fscache_read_folios_async,
> > and read data from fscache asyncronously. Make .readpage()/.readahead()
> > to use this new helper.
> >
> > Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> > ---
> > changes from RFC:
> > 1.rebase to fscache,erofs: fscache-based on-demand read semantics v10.
> > 2.fix issues pointed out by Jeffle.
> > 3.simplify parameters, add debug messages for erofs_fscache_read_folios_async.
> > 4.also change .readpage() to use new helper to avoid code duplication.
> >
> > I verified this patch introduces no regressions with tests in
> > https://github.com/lostjeffle/demand-read-cachefilesd.
> > ---
> >  fs/erofs/fscache.c | 267 +++++++++++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 227 insertions(+), 40 deletions(-)
> >
> > diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> > index a402d8f0a063..2606bf4145f8 100644
> > --- a/fs/erofs/fscache.c
> > +++ b/fs/erofs/fscache.c
> > @@ -5,57 +5,231 @@
> >  #include <linux/fscache.h>
> >  #include "internal.h"
> >
> > +static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq);
> > +
> > +static struct netfs_io_request *erofs_fscache_alloc_request(struct address_space *mapping,
> > +                                          loff_t start, size_t len)
> > +{
> > +     struct netfs_io_request *rreq;
> > +
> > +     rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
> > +     if (!rreq)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     rreq->start     = start;
> > +     rreq->len       = len;
> > +     rreq->mapping   = mapping;
> > +     INIT_LIST_HEAD(&rreq->subrequests);
> > +     refcount_set(&rreq->ref, 1);
> > +
> > +     return rreq;
> > +}
> > +
> > +static void erofs_fscache_clear_subrequests(struct netfs_io_request *rreq)
> > +{
> > +     struct netfs_io_subrequest *subreq;
> > +
> > +     while (!list_empty(&rreq->subrequests)) {
> > +             subreq = list_first_entry(&rreq->subrequests,
> > +                                       struct netfs_io_subrequest, rreq_link);
> > +             list_del(&subreq->rreq_link);
> > +             erofs_fscache_put_subrequest(subreq);
> > +     }
> > +}
> > +
> > +static void erofs_fscache_free_request(struct netfs_io_request *rreq)
> > +{
> > +     if (rreq->cache_resources.ops)
> > +             rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> > +     kfree(rreq);
> > +}
> > +
> > +static void erofs_fscache_put_request(struct netfs_io_request *rreq)
> > +{
> > +     if (refcount_dec_and_test(&rreq->ref))
> > +             erofs_fscache_free_request(rreq);
> > +}
> > +
> > +
> > +static struct netfs_io_subrequest *
> > +     erofs_fscache_alloc_subrequest(struct netfs_io_request *rreq)
> > +{
> > +     struct netfs_io_subrequest *subreq;
> > +
> > +     subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
> > +     if (subreq) {
> > +             INIT_LIST_HEAD(&subreq->rreq_link);
> > +             refcount_set(&subreq->ref, 2);
> > +             subreq->rreq = rreq;
> > +             refcount_inc(&rreq->ref);
> > +     }
> > +
> > +     return subreq;
> > +}
> > +
> > +static void erofs_fscache_free_subrequest(struct netfs_io_subrequest *subreq)
> > +{
> > +     struct netfs_io_request *rreq = subreq->rreq;
> > +
> > +     kfree(subreq);
> > +     erofs_fscache_put_request(rreq);
> > +}
>
> Yeah, as suggested by Gao Xaing, we'd better fold this function in.
> Besides, we could use "erofs_fscache_put_request(subreq->rreq)" instead
> to avoid the definition of the local variable @rreq, so that the code
> arrangement could be more compact :)
>
yes , I will fix it.

> > +
> > +static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq)
> > +{
> > +     if (refcount_dec_and_test(&subreq->ref))
> > +             erofs_fscache_free_subrequest(subreq);
> > +}
> > +
> > +
> > +static void erofs_fscache_rreq_unlock_folios(struct netfs_io_request *rreq)
> > +{
> > +     struct netfs_io_subrequest *subreq;
> > +     struct folio *folio;
> > +     unsigned int iopos;
> > +     pgoff_t start_page = rreq->start / PAGE_SIZE;
> > +     pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
> > +     bool subreq_failed = false;
> > +
> > +     XA_STATE(xas, &rreq->mapping->i_pages, start_page);
> > +
> > +     subreq = list_first_entry(&rreq->subrequests,
> > +                               struct netfs_io_subrequest, rreq_link);
> > +     iopos = 0;
> > +     subreq_failed = (subreq->error < 0);
> > +
> > +     rcu_read_lock();
> > +     xas_for_each(&xas, folio, last_page) {
> > +             unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
> > +             unsigned int pgend = pgpos + folio_size(folio);
> > +             bool pg_failed = false;
> > +
> > +             for (;;) {
> > +                     if (!subreq) {
> > +                             pg_failed = true;
> > +                             break;
> > +                     }
> > +
> > +                     pg_failed |= subreq_failed;
> > +                     if (pgend < iopos + subreq->len)
> > +                             break;
> > +
> > +                     iopos += subreq->len;
> > +                     if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
> > +                             subreq = list_next_entry(subreq, rreq_link);
> > +                             subreq_failed = (subreq->error < 0);
> > +                     } else {
> > +                             subreq = NULL;
> > +                             subreq_failed = false;
> > +                     }
> > +                     if (pgend == iopos)
> > +                             break;
> > +             }
> > +
> > +             if (!pg_failed)
> > +                     folio_mark_uptodate(folio);
> > +
> > +             folio_unlock(folio);
> > +     }
> > +     rcu_read_unlock();
> > +}
> > +
> > +
> > +static void erofs_fscache_rreq_complete(struct netfs_io_request *rreq)
> > +{
> > +     erofs_fscache_rreq_unlock_folios(rreq);
> > +     erofs_fscache_clear_subrequests(rreq);
> > +     erofs_fscache_put_request(rreq);
> > +}
> > +
> > +static void erofc_fscache_subreq_complete(void *priv, ssize_t transferred_or_error,
> > +                                     bool was_async)
> > +{
> > +     struct netfs_io_subrequest *subreq = priv;
> > +     struct netfs_io_request *rreq = subreq->rreq;
> > +
> > +     if (IS_ERR_VALUE(transferred_or_error))
> > +             subreq->error = transferred_or_error;
> > +
> > +     if (atomic_dec_and_test(&rreq->nr_outstanding))
> > +             erofs_fscache_rreq_complete(rreq);
> > +
> > +     erofs_fscache_put_subrequest(subreq);
> > +}
> > +
> >  /*
> >   * Read data from fscache and fill the read data into page cache described by
> > - * @start/len, which shall be both aligned with PAGE_SIZE. @pstart describes
> > + * @rreq, which shall be both aligned with PAGE_SIZE. @pstart describes
> >   * the start physical address in the cache file.
> >   */
> > -static int erofs_fscache_read_folios(struct fscache_cookie *cookie,
> > -                                  struct address_space *mapping,
> > -                                  loff_t start, size_t len,
> > +static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
> > +                                  struct netfs_io_request *rreq,
> >                                    loff_t pstart)
> >  {
> >       enum netfs_io_source source;
> > -     struct netfs_io_request rreq = {};
> > -     struct netfs_io_subrequest subreq = { .rreq = &rreq, };
> > -     struct netfs_cache_resources *cres = &rreq.cache_resources;
> > -     struct super_block *sb = mapping->host->i_sb;
> > +     struct super_block *sb = rreq->mapping->host->i_sb;
> > +     struct netfs_io_subrequest *subreq;
> > +     struct netfs_cache_resources *cres;
>         ^
> How about assigning "cres = &rreq->cache_resources" directly here?
>
> >       struct iov_iter iter;
> > +     loff_t start = rreq->start;
> > +     size_t len = rreq->len;
> >       size_t done = 0;
> >       int ret;
> >
> > +     atomic_set(&rreq->nr_outstanding, 1);
> > +
> > +     cres = &rreq->cache_resources;
>         ^
> As described, could be folded.
yes , this should be better.
>
>
> >       ret = fscache_begin_read_operation(cres, cookie);
> >       if (ret)
> > -             return ret;
> > +             goto out;
> >
> >       while (done < len) {
> > -             subreq.start = pstart + done;
> > -             subreq.len = len - done;
> > -             subreq.flags = 1 << NETFS_SREQ_ONDEMAND;
> > +             subreq = erofs_fscache_alloc_subrequest(rreq);
> > +             if (!subreq) {
> > +                     ret = -ENOMEM;
> > +                     goto out;
> > +             }
> > +
> > +             subreq->start = pstart + done;
> > +             subreq->len     =  len - done;
> > +             subreq->flags = 1 << NETFS_SREQ_ONDEMAND;
> >
> > -             source = cres->ops->prepare_read(&subreq, LLONG_MAX);
> > -             if (WARN_ON(subreq.len == 0))
> > +             list_add_tail(&subreq->rreq_link, &rreq->subrequests);
> > +
> > +             source = cres->ops->prepare_read(subreq, LLONG_MAX);
> > +             if (WARN_ON(subreq->len == 0))
> >                       source = NETFS_INVALID_READ;
> >               if (source != NETFS_READ_FROM_CACHE) {
> >                       erofs_err(sb, "failed to fscache prepare_read (source %d)",
> >                                 source);
> >                       ret = -EIO;
> > +                     subreq->error = ret;
> > +                     erofs_fscache_put_subrequest(subreq);
> >                       goto out;
> >               }
> >
> > -             iov_iter_xarray(&iter, READ, &mapping->i_pages,
> > -                             start + done, subreq.len);
> > -             ret = fscache_read(cres, subreq.start, &iter,
> > -                                NETFS_READ_HOLE_FAIL, NULL, NULL);
> > +             atomic_inc(&rreq->nr_outstanding);
> > +
> > +             iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
> > +                             start + done, subreq->len);
> > +
> > +             ret = fscache_read(cres, subreq->start, &iter,
> > +                                NETFS_READ_HOLE_FAIL, erofc_fscache_subreq_complete, subreq);
> > +
> > +             if (ret == -EIOCBQUEUED)
> > +                     ret = 0;
> > +
> >               if (ret) {
> >                       erofs_err(sb, "failed to fscache_read (ret %d)", ret);
> >                       goto out;
> >               }
> >
> > -             done += subreq.len;
> > +             done += subreq->len;
> >       }
> >  out:
> > -     fscache_end_operation(cres);
> > +     if (atomic_dec_and_test(&rreq->nr_outstanding))
> > +             erofs_fscache_rreq_complete(rreq);
> > +
> >       return ret;
> >  }
> >
> > @@ -64,6 +238,7 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
> >       int ret;
> >       struct folio *folio = page_folio(page);
> >       struct super_block *sb = folio_mapping(folio)->host->i_sb;
> > +     struct netfs_io_request *rreq;
> >       struct erofs_map_dev mdev = {
> >               .m_deviceid = 0,
> >               .m_pa = folio_pos(folio),
> > @@ -73,11 +248,13 @@ static int erofs_fscache_meta_readpage(struct file *data, struct page *page)
> >       if (ret)
> >               goto out;
> >
> > -     ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> > -                     folio_mapping(folio), folio_pos(folio),
> > -                     folio_size(folio), mdev.m_pa);
> > -     if (!ret)
> > -             folio_mark_uptodate(folio);
> > +     rreq = erofs_fscache_alloc_request(folio_mapping(folio),
> > +                             folio_pos(folio), folio_size(folio));
> > +     if (IS_ERR(rreq))
> > +             goto out;
> > +
> > +     return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> > +                             rreq, mdev.m_pa);
> >  out:
> >       folio_unlock(folio);
> >       return ret;
> > @@ -117,6 +294,7 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
> >       struct super_block *sb = inode->i_sb;
> >       struct erofs_map_blocks map;
> >       struct erofs_map_dev mdev;
> > +     struct netfs_io_request *rreq;
> >       erofs_off_t pos;
> >       loff_t pstart;
> >       int ret;
> > @@ -149,10 +327,15 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
> >       if (ret)
> >               goto out_unlock;
> >
> > +
> > +     rreq = erofs_fscache_alloc_request(folio_mapping(folio),
> > +                             folio_pos(folio), folio_size(folio));
> > +     if (IS_ERR(rreq))
> > +             goto out_unlock;
> > +
> >       pstart = mdev.m_pa + (pos - map.m_la);
> > -     ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> > -                     folio_mapping(folio), folio_pos(folio),
> > -                     folio_size(folio), pstart);
> > +     return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> > +                             rreq, pstart);
> >
> >  out_uptodate:
> >       if (!ret)
> > @@ -162,15 +345,16 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
> >       return ret;
> >  }
> >
>
>
> > -static void erofs_fscache_unlock_folios(struct readahead_control *rac,
> > -                                     size_t len)
> > +static void erofs_fscache_readahead_folios(struct readahead_control *rac,
> > +                                     size_t len, bool unlock)
> >  {
> >       while (len) {
> >               struct folio *folio = readahead_folio(rac);
> > -
> >               len -= folio_size(folio);
> > -             folio_mark_uptodate(folio);
> > -             folio_unlock(folio);
> > +             if (unlock) {
> > +                     folio_mark_uptodate(folio);
> > +                     folio_unlock(folio);
> > +             }
> >       }
> >  }
>
> How about renaming this function into "erofs_fscache_advance_folios"?
> Since people may misunderstand that erofs_fscache_readahead_folios() is
> the main body of .readahead().
make sense , I will fix it , and send the next version soon.

Thanks,
Xin Yin
>
> >
> > @@ -192,6 +376,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
> >       do {
> >               struct erofs_map_blocks map;
> >               struct erofs_map_dev mdev;
> > +             struct netfs_io_request *rreq;
> >
> >               pos = start + done;
> >               map.m_la = pos;
> > @@ -211,7 +396,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
> >                                       offset, count);
> >                       iov_iter_zero(count, &iter);
> >
> > -                     erofs_fscache_unlock_folios(rac, count);
> > +                     erofs_fscache_readahead_folios(rac, count, true);
> >                       ret = count;
> >                       continue;
> >               }
> > @@ -237,15 +422,17 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
> >               if (ret)
> >                       return;
> >
> > -             ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> > -                             rac->mapping, offset, count,
> > -                             mdev.m_pa + (pos - map.m_la));
> > +             rreq = erofs_fscache_alloc_request(rac->mapping, offset, count);
> > +             if (IS_ERR(rreq))
> > +                     return;
> >               /*
> > -              * For the error cases, the folios will be unlocked when
> > -              * .readahead() returns.
> > +              * Drop the ref of folios here. Unlock them in
> > +              * rreq_unlock_folios() when rreq complete.
> >                */
> > +             erofs_fscache_readahead_folios(rac, count, false);
> > +             ret = erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> > +                                     rreq, mdev.m_pa + (pos - map.m_la));
> >               if (!ret) {
> > -                     erofs_fscache_unlock_folios(rac, count);
> >                       ret = count;
> >               }
> >       } while (ret > 0 && ((done += ret) < len));
>
> --
> Thanks,
> Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

