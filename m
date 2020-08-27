Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF31B25496D
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Aug 2020 17:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598542193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=chnTycRnYCckX+QxDIZOGtcwvEz6LkBYz3e3YC/qbsk=;
	b=Kg72VSj2ymSheriAlZCSBmGRwIdoPn//vGzy+2LV4nfnT4l3qf5Uctd+cn/cTkUOQmMou7
	NgCcAsgUnOedZ58P4Tbw7a6ilnvctkPTCb2BK9XidbJbK+XXVrewVv0SlQI9fpXY7ASVi5
	JxRQRIs96vzjnXnPP++5FlcosfQSQvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-9U1OT6T5MX2o1szZI3H7_A-1; Thu, 27 Aug 2020 11:29:52 -0400
X-MC-Unique: 9U1OT6T5MX2o1szZI3H7_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94E3C18BE164;
	Thu, 27 Aug 2020 15:29:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF07610AF;
	Thu, 27 Aug 2020 15:29:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 402F2668E0;
	Thu, 27 Aug 2020 15:29:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RFT2KK023628 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 11:29:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5526C5C1DA; Thu, 27 Aug 2020 15:29:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-127.rdu2.redhat.com
	[10.10.120.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14FE85C1C2;
	Thu, 27 Aug 2020 15:28:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200810164044.GA31753@lst.de>
References: <20200810164044.GA31753@lst.de>
	<1851200.1596472222@warthog.procyon.org.uk>
	<447452.1596109876@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <1428310.1598542135.1@warthog.procyon.org.uk>
Date: Thu, 27 Aug 2020 16:28:55 +0100
Message-ID: <1428311.1598542135@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for
	now
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@lst.de> wrote:

> FYI, a giant rewrite dropping support for existing consumer is always
> rather awkward.  Is there any way you could pre-stage some infrastructure
> changes, and then do a temporary fscache2, which could then be renamed
> back to fscache once everyone switched over?

That's a bit tricky.  There are three points that would have to be shared: the
userspace miscdev interface, the backing filesystem and the single index tree.

It's probably easier to just have a go at converting 9P and cifs.  Making the
old and new APIs share would be a fairly hefty undertaking in its own right.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

