Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1F91A1CBA6E
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 00:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588975709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hC0yETuuP/ZGxAaULy0+WofLP8Vshte/LRlbVFrX6Mg=;
	b=SuJCQipDFeAe/DRjQonS/yTXR3MffD+4vMthLyiUANy0ORc6gHglQo9TUjZdQnH44/iGHQ
	BP57K2dlsbq6t1X0acNOcnV2D2PGj8dYYQxBoVdceeJ0J2FPt9y/I5pxcH9Sk9CZl50kHT
	NeUN9CL30clNSsYORX3St4+hOvqP/w8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40--t_bkSGWN1O4VMqZibRSTA-1; Fri, 08 May 2020 18:08:27 -0400
X-MC-Unique: -t_bkSGWN1O4VMqZibRSTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFC1F80183C;
	Fri,  8 May 2020 22:08:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 936DE19167;
	Fri,  8 May 2020 22:08:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D75681809543;
	Fri,  8 May 2020 22:08:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048M8KFB023158 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 18:08:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 950B7341FD; Fri,  8 May 2020 22:08:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
	[10.10.118.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0AF2E183;
	Fri,  8 May 2020 22:08:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <158897464246.1116213.8184341356151224705.stgit@warthog.procyon.org.uk>
References: <158897464246.1116213.8184341356151224705.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-ID: <1118495.1588975692.1@warthog.procyon.org.uk>
Date: Fri, 08 May 2020 23:08:12 +0100
Message-ID: <1118496.1588975692@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, Carlos Maiolino <cmaiolino@redhat.com>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 0/4] cachefiles, nfs: Fixes
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Oops - I forgot to include a patch.  I'll resend.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

