Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D044103D
	for <lists+linux-cachefs@lfdr.de>; Sun, 31 Oct 2021 19:40:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-4wydv2aEMymwcuvIl4F18A-1; Sun, 31 Oct 2021 14:40:48 -0400
X-MC-Unique: 4wydv2aEMymwcuvIl4F18A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D814D1808319;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA8A5C1C5;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62D77181A1D0;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19S2Kd8J031315 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 22:20:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 319A21121315; Thu, 28 Oct 2021 02:20:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6D71121314
	for <linux-cachefs@redhat.com>; Thu, 28 Oct 2021 02:20:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F24918A0160
	for <linux-cachefs@redhat.com>; Thu, 28 Oct 2021 02:20:36 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-263-tCa9aNGCNn6Ku4CZlk4dMg-1; Wed, 27 Oct 2021 22:20:34 -0400
X-MC-Unique: tCa9aNGCNn6Ku4CZlk4dMg-1
Received: by mail-ed1-f42.google.com with SMTP id h7so18783199ede.8;
	Wed, 27 Oct 2021 19:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d+wQZhyCwuaSol1jeoxc8MwW4vFU/MqWckHBmmor4ps=;
	b=dCNhRuBvnUsdRwOT77PleVS0QWAU0Mu+UzjI+hB7e90B/cqdKcF1qijAtWsGxG5NQ9
	H8VThfaOQ9efkZl1W0T4wdxjALGtEYzvyFIK5wUP8nsO77Pi+xS9ujsuVKPgnubqEmyj
	Cqjxl4oGsneFHZh7OC2ivWMtu4oBSbvdF2EHqiP27fxeF4KV3edeCHHyj4PqWxCKob2e
	ekqpy78lMXO679XEO9ArYx6x5mX6t97IKP8L+mF0dvTl++U2f2jVogSt2VaZ4L34v6kY
	0StI08kWXgkAXx13oI1Bjogv4zWd0+eYqtotTVN6Vro3Huw4J0IB523rYAhuTTx35q79
	/phQ==
X-Gm-Message-State: AOAM531jueo1BJddbqsDr+Sneuf05DLal1Uz1DP4cUk89al9jT/GdhbF
	GPHNRvhQjW/rYjiqZwVNIeYAM/AoUnT9Tkfo9ZUJD9UjAnvEr3Lo
X-Google-Smtp-Source: ABdhPJzmVKkRycepS+exbnYCD1GiRrAHb9ylHxB5j/gQ8W6QUWHxQfuoZmhJVTcVtNezDFUKSTz7Io1giVRPzC23FNE=
X-Received: by 2002:a17:906:794:: with SMTP id
	l20mr1671760ejc.419.1635387633269; 
	Wed, 27 Oct 2021 19:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211027150732.4158273-1-mudongliangabcd@gmail.com>
	<a2f738d08d14417a693c6f0d7f97faff448595ab.camel@kernel.org>
In-Reply-To: <a2f738d08d14417a693c6f0d7f97faff448595ab.camel@kernel.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 28 Oct 2021 10:20:07 +0800
Message-ID: <CAD-N9QV=Nd+T3wa6xyq6WOP7Mex7s4_sCFnvAM8FU+_dOFHgqQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 31 Oct 2021 14:40:40 -0400
Cc: linux-cachefs@redhat.com, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH] fscache: fix GPF in fscache_free_cookie
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 27, 2021 at 11:16 PM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Wed, 2021-10-27 at 23:07 +0800, Dongliang Mu wrote:
> > If fscache_alloc_cookie encounters memory allocation failure, it will
> > go to nomem label and invoke fscache_free_cookie. However,
> > fscache_alloc_cookie assumes current cookie is already linked into
> > fscache_cookies and directly calls list_del. This assumption does not
> > hold since list_add is not called in the above scenario. As a result, it
> > will lead to Null Pointer Dereference. The stack trace is in the
> > following.
> >
> > Call Trace:
> >  __list_del_entry include/linux/list.h:132 [inline]
> >  list_del include/linux/list.h:146 [inline]
> >  fscache_free_cookie fs/fscache/cookie.c:71 [inline]
> >  fscache_free_cookie+0x3f/0x100 fs/fscache/cookie.c:66
> >  fscache_alloc_cookie+0x2e2/0x300 fs/fscache/cookie.c:195
> >  __fscache_acquire_cookie fs/fscache/cookie.c:296 [inline]
> >  __fscache_acquire_cookie+0x132/0x380 fs/fscache/cookie.c:257
> >  fscache_acquire_cookie include/linux/fscache.h:334 [inline]
> >  v9fs_cache_session_get_cookie+0x74/0x120 fs/9p/cache.c:60
> >  v9fs_session_init+0x724/0xa90 fs/9p/v9fs.c:471
> >  v9fs_mount+0x56/0x450 fs/9p/vfs_super.c:126
> >  legacy_get_tree+0x2b/0x90 fs/fs_context.c:610
> >  vfs_get_tree+0x28/0x100 fs/super.c:1498
> >  do_new_mount fs/namespace.c:2988 [inline]
> >  path_mount+0xb92/0xfe0 fs/namespace.c:3318
> >  do_mount+0xa1/0xc0 fs/namespace.c:3331
> >  __do_sys_mount fs/namespace.c:3539 [inline]
> >  __se_sys_mount fs/namespace.c:3516 [inline]
> >  __x64_sys_mount+0xf4/0x160 fs/namespace.c:3516
> >
> > Fix this by moving the list_add_tail before goto statements.
> >
> > Fixes: 884a76881fc5 ("fscache: Procfile to display cookies")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  fs/fscache/cookie.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> > index cd42be646ed3..d101e212db74 100644
> > --- a/fs/fscache/cookie.c
> > +++ b/fs/fscache/cookie.c
> > @@ -150,6 +150,11 @@ struct fscache_cookie *fscache_alloc_cookie(
> >       if (!cookie)
> >               return NULL;
> >
> > +     /* move list_add_tail before any error handling code */
> > +     write_lock(&fscache_cookies_lock);
> > +     list_add_tail(&cookie->proc_link, &fscache_cookies);
> > +     write_unlock(&fscache_cookies_lock);
> > +
> >       cookie->key_len = index_key_len;
> >       cookie->aux_len = aux_data_len;
> >
> > @@ -186,9 +191,6 @@ struct fscache_cookie *fscache_alloc_cookie(
> >        * told it may not wait */
> >       INIT_RADIX_TREE(&cookie->stores, GFP_NOFS & ~__GFP_DIRECT_RECLAIM);
> >
> > -     write_lock(&fscache_cookies_lock);
> > -     list_add_tail(&cookie->proc_link, &fscache_cookies);
> > -     write_unlock(&fscache_cookies_lock);
> >       return cookie;
> >
> >  nomem:
>
> Nice catch!
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>

Hi Jeff,

fscache_free_cookie also has an issue in cookie->backing_objects, but
it does not affect the execution. The reason is in the following:

At first, I observed that the cookie->backing_objects in
fscache_alloc_cookie is not initialized with INIT_HLIST_HEAD when an
error occurs. It may lead to some issues in the fscache_free_cookie,
e.g., WARN_ON.

Actually, it does not due to the zero initialization of
kmem_cache_zalloc before. cookie->backing_objects is already with two
null pointers. It does not need INIT_HLIST_HEAD.

And in the fscache_free_cookie, it actually does not trigger
WARN_ON(!hlist_empty()).

So I wonder if we need to explicitly move INIT_HLIST_HEAD before any
error handling code.

>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

