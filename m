Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63748D37A
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 09:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642062063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wN7v5fv2P9DRmrOmXip4siPI+nZyivTnJZeSaIHdxes=;
	b=CRKRWfhJOKj5/fqkdhDGJDM5NwFEKX1sPB4iSVc24FDxkLqzQYbLv1k+DVhfHPt10CizCn
	Hd0h+IdjZRAIDGom8qQz3fMEnKG1wx7UlekHp4AIfoz161dvslUZdz1NRuDwfCG8pZUsQ7
	enwPb80LBTUe/W5ymohbN9Ubr6+rMYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-J_yVdF4yP_iPZOMzOebXug-1; Thu, 13 Jan 2022 03:20:29 -0500
X-MC-Unique: J_yVdF4yP_iPZOMzOebXug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02C4B100C665;
	Thu, 13 Jan 2022 08:20:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7515A6E1F5;
	Thu, 13 Jan 2022 08:20:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFD474A700;
	Thu, 13 Jan 2022 08:20:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20D8AZJ1019017 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 03:10:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CA7C4ABAD; Thu, 13 Jan 2022 08:10:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06B8E5E48A;
	Thu, 13 Jan 2022 08:10:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <b274b05b-db23-2b11-c347-fbfe3de0917d@linux.alibaba.com>
References: <b274b05b-db23-2b11-c347-fbfe3de0917d@linux.alibaba.com>
	<20211228124419.103020-1-jefflexu@linux.alibaba.com>
	<693ab77bab10b38b1ddab373211c24722e79fee2.camel@kernel.org>
To: JeffleXu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 13 Jan 2022 08:10:33 +0000
Message-ID: <1481799.1642061433@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: make ops->init_rreq() optional
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
Content-ID: <1481798.1642061433.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yep.  My patchset got pulled, so I'll take it now.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

