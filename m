Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18796467ADB
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 17:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638547707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6NFJE7eYQJzMi2ZFntpnNBDhkHX9GLmToBbN37gRhPQ=;
	b=WIl9k/Qt20GPDnosDsHd2i1HSD5a0ahPlum3hVyLjXzTd1iL/tWAkb0sBYRMyZ9PPYLmVJ
	1rcRAve+lvit26hzHuyFva67ty6XPbNmZmZgozaYN8xjHDMr05dPf0/gnyFIpzsawD2DQR
	+Q3GobE5qn+TxA9csL5ltQwI/2TQIiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-236-kK5_MPwLPEGWd1P5F64ODA-1; Fri, 03 Dec 2021 11:08:25 -0500
X-MC-Unique: kK5_MPwLPEGWd1P5F64ODA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389FC84B9A5;
	Fri,  3 Dec 2021 16:08:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EDB545D66;
	Fri,  3 Dec 2021 16:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 865A74CA93;
	Fri,  3 Dec 2021 16:08:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B3G8Hc4004812 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 11:08:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2189160CC3; Fri,  3 Dec 2021 16:08:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E710060C13;
	Fri,  3 Dec 2021 16:08:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
References: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
To: Shyam Prasad N <nspmangalore@gmail.com>
MIME-Version: 1.0
Date: Fri, 03 Dec 2021 16:08:04 +0000
Message-ID: <997927.1638547684@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@cjr.nz>,
	Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] cifs: wait for tcon resource_id before
	getting fscache super
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <997926.1638547684.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Your patches all got mangled.  Spaces converted to tabs.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

