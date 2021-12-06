Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A074694A1
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Dec 2021 12:00:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-_n8anDGHPfWtfxEP2gQp1Q-1; Mon, 06 Dec 2021 06:00:13 -0500
X-MC-Unique: _n8anDGHPfWtfxEP2gQp1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150C51023F4D;
	Mon,  6 Dec 2021 11:00:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68776781F1;
	Mon,  6 Dec 2021 11:00:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC2624BB7C;
	Mon,  6 Dec 2021 11:00:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B6B05tX026611 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 06:00:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D7BF51FF; Mon,  6 Dec 2021 11:00:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65EF751EF
	for <linux-cachefs@redhat.com>; Mon,  6 Dec 2021 11:00:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74D372A31DC3
	for <linux-cachefs@redhat.com>; Mon,  6 Dec 2021 11:00:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-132-FZMi13HSOvC2t1cDuyDs-A-1; Mon, 06 Dec 2021 06:00:00 -0500
X-MC-Unique: FZMi13HSOvC2t1cDuyDs-A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B78F961231;
	Mon,  6 Dec 2021 10:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F48BC341C1;
	Mon,  6 Dec 2021 10:59:58 +0000 (UTC)
Message-ID: <dfd01818f8de7e47b3f8bc56550f6db0e977be76.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Mon, 06 Dec 2021 05:59:57 -0500
In-Reply-To: <1219681.1638784646@warthog.procyon.org.uk>
References: <20211129162907.149445-2-jlayton@kernel.org>
	<20211129162907.149445-1-jlayton@kernel.org>
	<1219681.1638784646@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, idryomov@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 1/2] ceph: conversion to new fscache API
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

On Mon, 2021-12-06 at 09:57 +0000, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> >  		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
> 
> There's a function for the first part of this:
> 
> 		if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
> 
> > +	fsc->fscache = fscache_acquire_volume(name, NULL, 0);
> >  
> >  	if (fsc->fscache) {
> >  		ent->fscache = fsc->fscache;
> >  		list_add_tail(&ent->list, &ceph_fscache_list);
> 
> It shouldn't really be necessary to have ceph_fscache_list since
> fscache_acquire_volume() will do it's own duplicate check.  I wonder if I
> should make fscache_acquire_volume() return -EEXIST or -EBUSY rather than NULL
> in such a case and not print an error, but rather leave that to the filesystem
> to display.
> 
> That would allow you to get rid of the ceph_fscache_entry struct also, I
> think.
> 

Returning an error there sounds like a better thing to do.

I'll make the other changes you suggested now. Let me know if you change
the fscache_acquire_volume return.

> > +#define FSCACHE_USE_NEW_IO_API
> 
> That doesn't exist anymore.
> 
> > +		/*
> > +		 * If we're truncating up, then we should be able to just update
> > +		 * the existing cookie.
> > +		 */
> > +		if (size > isize)
> > +			ceph_fscache_update(inode);
> 
> Might look better to say "expanding" rather than "truncating up".
> 
> David
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

