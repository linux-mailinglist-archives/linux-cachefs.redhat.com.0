Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F73464D1D
	for <lists+linux-cachefs@lfdr.de>; Wed,  1 Dec 2021 12:37:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-jU2-IzCVOwiD5k85a-5Tiw-1; Wed, 01 Dec 2021 06:37:30 -0500
X-MC-Unique: jU2-IzCVOwiD5k85a-5Tiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C383381CCBA;
	Wed,  1 Dec 2021 11:37:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE12C79454;
	Wed,  1 Dec 2021 11:37:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CBF51809C89;
	Wed,  1 Dec 2021 11:37:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B1BbKYf004022 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 1 Dec 2021 06:37:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1605040CFD10; Wed,  1 Dec 2021 11:37:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10B5C40CFD0E
	for <linux-cachefs@redhat.com>; Wed,  1 Dec 2021 11:37:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC3A380158D
	for <linux-cachefs@redhat.com>; Wed,  1 Dec 2021 11:37:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-432-qRF9mEGlPcOdj63Yt8j-2Q-1; Wed, 01 Dec 2021 06:37:18 -0500
X-MC-Unique: qRF9mEGlPcOdj63Yt8j-2Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 31EA8CE1DCC;
	Wed,  1 Dec 2021 11:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C9DC53FAD;
	Wed,  1 Dec 2021 11:31:01 +0000 (UTC)
Message-ID: <06e4f9955ee9e964724ecc2047fef6e4c9606b14.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Wed, 01 Dec 2021 06:31:00 -0500
In-Reply-To: <278917.1638204396@warthog.procyon.org.uk>
References: <20211129162907.149445-2-jlayton@kernel.org>
	<20211129162907.149445-1-jlayton@kernel.org>
	<278917.1638204396@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-11-29 at 16:46 +0000, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > +void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info* ci)
> >  {
> > -	return fscache_register_netfs(&ceph_cache_netfs);
> > +	struct fscache_cookie* cookie = xchg(&ci->fscache, NULL);
> > +
> > +	fscache_relinquish_cookie(cookie, false);
> >  }
> 
> xchg() should be excessive there.  This is only called from
> ceph_evict_inode().  Also, if you're going to reset the pointer, it might be
> worth poisoning it rather than nulling it.
> 

Ok, makes sense. I'll make that change soon.
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

