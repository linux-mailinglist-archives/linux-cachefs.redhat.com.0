Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8F31340433
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Mar 2021 12:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616065726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VHM+L2yQ7p46p0WdeMgaVZ5FdHASYxitmlN3675l2vg=;
	b=KcZgktHc1Eqf4NogzDxTeBh9QMR6dCrOTI53qk4TqmSzCRfXqbEW/m68eIKth2ysEyYPGR
	cxVErdA4hLxIhm4AY8CoWOt7SI7fZKteFTJo9Yzr/JQ/Bf9gKZWJU3u8WgsyuI7wgUYcJf
	qpoqrRwuSs3bpubqVTSQEiy+aop8jjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-Lf1l7V7JPoOYm4hjmgb4zA-1; Thu, 18 Mar 2021 07:08:44 -0400
X-MC-Unique: Lf1l7V7JPoOYm4hjmgb4zA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E3FF108BD0B;
	Thu, 18 Mar 2021 11:08:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34EF160C13;
	Thu, 18 Mar 2021 11:08:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF00E1809C83;
	Thu, 18 Mar 2021 11:08:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12IB8Xmd016822 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 18 Mar 2021 07:08:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACAFD6268F; Thu, 18 Mar 2021 11:08:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-138.rdu2.redhat.com
	[10.10.113.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B35F16A8EA;
	Thu, 18 Mar 2021 11:08:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210316153332.3737543-1-christian.brauner@ubuntu.com>
References: <20210316153332.3737543-1-christian.brauner@ubuntu.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
MIME-Version: 1.0
Date: Thu, 18 Mar 2021 11:08:28 +0000
Message-ID: <372243.1616065708@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <372242.1616065708.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christian Brauner <christian.brauner@ubuntu.com> wrote:

> Based on discussion with David Howells my understanding of cachefiles
> and the cachefiles userspace daemon is that it creates a cache on a
> local filesystem (e.g. ext4, xfs etc.) for a network filesystem. The way
> this is done is by writing "bind" to /dev/cachefiles and pointing it to
> the directory to use as the cache.
> So from our offline discussion I gather that cachefilesd creates a cache
> on a local filesystem (ext4, xfs etc.) for a network filesystem. The way
> this is done is by writing "bind" to /dev/cachefiles and pointing it to
> a directory to use as the cache.

You might want to edit that a bit.  It seems you mostly duplicated the first
paragraph.

Looks okay, apart from that, but I'd recommend putting a pr_warn() in there.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

