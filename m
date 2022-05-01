Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7251636A
	for <lists+linux-cachefs@lfdr.de>; Sun,  1 May 2022 11:32:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-6Ju1eNP_PNaBvehzyzF4aQ-1; Sun, 01 May 2022 05:32:31 -0400
X-MC-Unique: 6Ju1eNP_PNaBvehzyzF4aQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96A7E833942;
	Sun,  1 May 2022 09:32:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1BCC2026D2F;
	Sun,  1 May 2022 09:32:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87F681947060;
	Sun,  1 May 2022 09:32:27 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 30A47194705D for <linux-cachefs@listman.corp.redhat.com>;
 Sun,  1 May 2022 09:32:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17FF04026BA; Sun,  1 May 2022 09:32:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13F334026B9
 for <linux-cachefs@redhat.com>; Sun,  1 May 2022 09:32:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA2CB8015BA
 for <linux-cachefs@redhat.com>; Sun,  1 May 2022 09:32:25 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-XcqvSc3YPCqo09R0UgB51w-1; Sun, 01 May 2022 05:32:24 -0400
X-MC-Unique: XcqvSc3YPCqo09R0UgB51w-1
Received: by mail-lf1-f52.google.com with SMTP id p12so20903993lfs.5
 for <linux-cachefs@redhat.com>; Sun, 01 May 2022 02:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfd8pz6D60X5cevhdgNu8YCYSK6zqtfGuCPUMgI+JU0=;
 b=etnd6J/INySoW+mneR1O4aIH0AgAu/PuTdGlOFdHgXEH0VuHTd8qNIHu0dIyt0CpOi
 OJ0AmKRvq23/nbC3d/ApMFnhq4lqZkLWVDD37fevJO4QjT/kO9shrGAFpik+vK9OYl9y
 nFHwwmYPsuJmc/OW/kjJZ40GbNnu1O0WnVT3f99cbijJ82EVglLVVjlAZ22Jk84ENs6H
 Ru/Tby24pcT1IeUl5XYC1HVgPJ+8hseglvY6ATa7HktWK7VHi2dIcEbWJdjRjZbAaJ3l
 7R+86gHZ9X22mhmb2D8kfZcYOvZMwh+zg/YpcbQoJlcBLBvZcG6n7Trwy306qpSVA+9a
 zEsA==
X-Gm-Message-State: AOAM531IoQTMdv2jxzWa3gHejRx/x6Xbh5wArY8C68d9ndN6LXLT9gPb
 fAFkdrAoB5FohvY1C1Xf4oPptnrUhC9ONSuXZ2Bmbw==
X-Google-Smtp-Source: ABdhPJwljDFQqBbcUKtAIfD6XrxKp8CImZp+3pI3rG8wAEBbpbikmsiwgEawltgho3+dn+WxYoquGxmuocSsAzmdIgk=
X-Received: by 2002:ac2:5319:0:b0:471:fc6e:674f with SMTP id
 c25-20020ac25319000000b00471fc6e674fmr5497163lfh.493.1651397539079; Sun, 01
 May 2022 02:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220428233849.321495-1-yinxin.x@bytedance.com>
 <20220428233849.321495-2-yinxin.x@bytedance.com>
 <e054bee7-88a8-65c3-5390-84ff46ef36f2@linux.alibaba.com>
In-Reply-To: <e054bee7-88a8-65c3-5390-84ff46ef36f2@linux.alibaba.com>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Sun, 1 May 2022 17:32:09 +0800
Message-ID: <CAK896s4_p7dqx8covVZQPcfbssX5Azcc7pENZG=h9-cu=xfMnA@mail.gmail.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [External] Re: [RFC PATCH 1/1] erofs: change to
 use asynchronous io for fscache readahead
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
Cc: linux-fsdevel@vger.kernel.org, xiang@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 30, 2022 at 11:15 AM JeffleXu <jefflexu@linux.alibaba.com> wrote:
>
> Hi Xin,
>
> Thanks for the awsome work, which is exacly what we need.
>
>
>
> On 4/29/22 7:38 AM, Xin Yin wrote:
> > Add erofs_fscache_read_folios_async helper which has same on-demand
> > read logic with erofs_fscache_read_folios, also support asynchronously
> > read data from fscache.And change .readahead() to use this new helper.
> >
> > Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> > ---
> >  fs/erofs/fscache.c | 256 ++++++++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 245 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> > index eaa50692ddba..4241f1cdc30b 100644
> > --- a/fs/erofs/fscache.c
> > +++ b/fs/erofs/fscache.c
> > @@ -5,6 +5,231 @@
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
>
>
> > +static void erofs_fscache_free_request(struct netfs_io_request *rreq)
> > +{
> > +     erofs_fscache_clear_subrequests(rreq);
>
> Actually I don't underdtand why erofs_fscache_clear_subrequests() is
> needed here. erofs_fscache_free_request() is called only when rreq->ref
> has been decreased to 0. That means there's already no subrequest, or
> rreq->ref won't be 0 since each subrequest maintains one refcount of
> rreq. Though I know it's a copy from netfs_free_request()...
>
Yes, for now most of the procedures are implemented with reference to
netfs. And yeah, I think at least in our scenario this is not needed,
I will remove it in the next version , and do further checks and
tests.
>
> > +     if (rreq->cache_resources.ops)
> > +             rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> > +     kfree(rreq);
> > +}
> > +
> > +static void erofs_fscache_put_request(struct netfs_io_request *rreq)
> > +{
> > +     bool dead;
> > +
> > +     dead = refcount_dec_and_test(&rreq->ref);
> > +     if (dead)
> > +             erofs_fscache_free_request(rreq);
> > +}
>
> How about making erofs_fscache_free_request() folded inside
> erofs_fscache_put_request(), since here each function is quite short?
>
> Besides, how about
>
> if (refcount_dec_and_test(&rreq->ref)) {
>         /* erofs_fscache_free_request */
> }
>
Yes , this should be better. will fix it in next version.
>
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
>
>
> > +static void erofs_fscache_free_subrequest(struct netfs_io_subrequest *subreq)
> > +{
> > +     struct netfs_io_request *rreq = subreq->rreq;
> > +
> > +     kfree(subreq);
> > +     erofs_fscache_put_request(rreq);
> > +}
> > +
> > +static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *subreq)
> > +{
> > +     bool dead;
> > +
> > +     dead = refcount_dec_and_test(&subreq->ref);
> > +     if (dead)
> > +             erofs_fscache_free_subrequest(subreq);
> > +}
>
> Similar to the issue of erofs_fscache_put_request().
>
Will fix it.
>
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
> > +static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie,
> > +                                  struct netfs_io_request *rreq,
> > +                                  loff_t start, size_t len,
> > +                                  loff_t pstart)
> > +{
> > +     enum netfs_io_source source;
> > +     struct netfs_io_subrequest *subreq;
> > +     struct netfs_cache_resources *cres;
> > +     struct iov_iter iter;
> > +     size_t done = 0;
> > +     int ret;
> > +
> > +     atomic_set(&rreq->nr_outstanding, 1);
> > +
> > +     cres = &rreq->cache_resources;
> > +     ret = fscache_begin_read_operation(cres, cookie);
> > +     if (ret)
> > +             goto out;
> > +
> > +     while (done < len) {
> > +             subreq = erofs_fscache_alloc_subrequest(rreq);
> > +             if (!subreq) {
> > +                     ret = -ENOMEM;
> > +                     goto out;
> > +             }
> > +
> > +             subreq->start = pstart + done;
> > +             subreq->len     =  len - done;
> > +             subreq->flags = 1 << NETFS_SREQ_ONDEMAND;
> > +
> > +             list_add_tail(&subreq->rreq_link, &rreq->subrequests);
> > +
> > +             source = cres->ops->prepare_read(subreq, LLONG_MAX);
> > +             if (WARN_ON(subreq->len == 0))
> > +                     source = NETFS_INVALID_READ;
> > +             if (source != NETFS_READ_FROM_CACHE) {
> > +                     ret = -EIO;
> > +                     erofs_fscache_put_subrequest(subreq);
> > +                     goto out;
>
> Need to set subreq->error here before going to out?
>
Make sense ,  I think this issue may cause some pages to be
incorrectly set to uptodate. I will fix this in next version , and do
further exception tests.
>
> > +             }
> > +
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
> > +             if (ret) {
> > +                     erofs_fscache_put_subrequest(subreq);
>
> I think erofs_fscache_put_subrequest() here is not needed, since when
> error encountered, erofc_fscache_subreq_complete() will be called inside
> fscache_read(), in which erofs_fscache_put_subrequest() will be called
> already.
>
yes , will remove it in the next version.
> > +                     goto out;
> > +             }
> > +
> > +             done += subreq->len;
> > +     }
> > +out:
> > +     if (atomic_dec_and_test(&rreq->nr_outstanding))
> > +             erofs_fscache_rreq_complete(rreq);
> > +
> > +     return ret;
> > +}
> BTW, could you please also help covert the original synchronous
> erofs_fscache_read_folios() to calling erofs_fscache_read_folios_async()
> to avoid code duplication?
>
Yeah , I will do this in the next version.

Thank,
Xin Yin
> > +
> >  /*
> >   * Read data from fscache and fill the read data into page cache described by
> >   * @start/len, which shall be both aligned with PAGE_SIZE. @pstart describes
> > @@ -163,15 +388,16 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
> >       return ret;
> >  }
> >
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
> >
> > @@ -193,6 +419,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
> >       do {
> >               struct erofs_map_blocks map;
> >               struct erofs_map_dev mdev;
> > +             struct netfs_io_request *rreq;
> >
> >               pos = start + done;
> >               map.m_la = pos;
> > @@ -212,7 +439,7 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
> >                                       offset, count);
> >                       iov_iter_zero(count, &iter);
> >
> > -                     erofs_fscache_unlock_folios(rac, count);
> > +                     erofs_fscache_readahead_folios(rac, count, true);
> >                       ret = count;
> >                       continue;
> >               }
> > @@ -238,13 +465,20 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
> >               if (ret)
> >                       return;
> >
> > -             ret = erofs_fscache_read_folios(mdev.m_fscache->cookie,
> > -                             rac->mapping, offset, count,
> > +             rreq = erofs_fscache_alloc_request(rac->mapping, offset, count);
> > +             if (IS_ERR(rreq))
> > +                     return;
> > +             /*
> > +              * Drop the ref of folios here. Unlock them in
> > +              * rreq_unlock_folios() when rreq complete.
> > +              */
> > +             erofs_fscache_readahead_folios(rac, count, false);
> > +             ret = erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> > +                             rreq, offset, count,
> >                               mdev.m_pa + (pos - map.m_la));
> > -             if (!ret) {
> > -                     erofs_fscache_unlock_folios(rac, count);
> > +
> > +             if (!ret)
> >                       ret = count;
> > -             }
> >       } while (ret > 0 && ((done += ret) < len));
> >  }
> >
>
>
>
> --
> Thanks,
> Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

