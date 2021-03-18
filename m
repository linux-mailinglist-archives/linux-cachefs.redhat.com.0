Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9B4340468
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Mar 2021 12:16:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-F8prTTchMJSfFtNfL3WYyg-1; Thu, 18 Mar 2021 07:16:56 -0400
X-MC-Unique: F8prTTchMJSfFtNfL3WYyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B83B581431D;
	Thu, 18 Mar 2021 11:16:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4AE017DC3;
	Thu, 18 Mar 2021 11:16:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 312B74A7CA;
	Thu, 18 Mar 2021 11:16:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12IBGp4n017473 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 18 Mar 2021 07:16:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77E1F10F26FD; Thu, 18 Mar 2021 11:16:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7414C10F26FB
	for <linux-cachefs@redhat.com>; Thu, 18 Mar 2021 11:16:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F223F800883
	for <linux-cachefs@redhat.com>; Thu, 18 Mar 2021 11:16:48 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-xJpv53itOgePzeOLUNGa-g-1; Thu, 18 Mar 2021 07:16:44 -0400
X-MC-Unique: xJpv53itOgePzeOLUNGa-g-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1lMqdv-0000Xe-IV; Thu, 18 Mar 2021 11:16:43 +0000
Date: Thu, 18 Mar 2021 12:16:42 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210318111642.hxbf753fgykyozy5@wittgenstein>
References: <20210316153332.3737543-1-christian.brauner@ubuntu.com>
	<372243.1616065708@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <372243.1616065708@warthog.procyon.org.uk>
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
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH v2] cachefiles: do not yet allow on
	idmapped mounts
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 18, 2021 at 11:08:28AM +0000, David Howells wrote:
> Christian Brauner <christian.brauner@ubuntu.com> wrote:
> 
> > Based on discussion with David Howells my understanding of cachefiles
> > and the cachefiles userspace daemon is that it creates a cache on a
> > local filesystem (e.g. ext4, xfs etc.) for a network filesystem. The way
> > this is done is by writing "bind" to /dev/cachefiles and pointing it to
> > the directory to use as the cache.
> > So from our offline discussion I gather that cachefilesd creates a cache
> > on a local filesystem (ext4, xfs etc.) for a network filesystem. The way
> > this is done is by writing "bind" to /dev/cachefiles and pointing it to
> > a directory to use as the cache.
> 
> You might want to edit that a bit.  It seems you mostly duplicated the first
> paragraph.

Oh odd that's probably me having reformulate the paragraph but then kept
the part that I reformulated? Weird. Will fix.

> 
> Looks okay, apart from that, but I'd recommend putting a pr_warn() in there.

Will do.

Christian

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

