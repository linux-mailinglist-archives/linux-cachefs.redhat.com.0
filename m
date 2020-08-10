Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CFF6D24083D
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 17:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597072638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tcby+YzKDzxnb+CWr5uitZqORb07VWnGlHVuNS3GpPQ=;
	b=gZqMWoUoC/5HGcfqQU+YqyYHsWTOydSHTH4wQK8EIkjf6y5GKG5pbZ5SEqBzMXN2TSAuqX
	qIny6tb7klVl7Ayv/xukrwR2KLgg/DWY3nGBxdzM5hYo9s3DIykQRA1ozCnFwxrA4NWpLO
	Zbi6BhivRay3vKsVyo4wD5n9NzdI3wI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-x0_X4ci4N9qyu7XZjxe7hg-1; Mon, 10 Aug 2020 11:17:17 -0400
X-MC-Unique: x0_X4ci4N9qyu7XZjxe7hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD3B957;
	Mon, 10 Aug 2020 15:17:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 738566F123;
	Mon, 10 Aug 2020 15:17:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4413C1809554;
	Mon, 10 Aug 2020 15:17:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AFH7MW007343 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 11:17:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BEEE5D9E4; Mon, 10 Aug 2020 15:17:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-69.rdu2.redhat.com
	[10.10.113.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB1795D9CD;
	Mon, 10 Aug 2020 15:16:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1851200.1596472222@warthog.procyon.org.uk>
References: <1851200.1596472222@warthog.procyon.org.uk>
	<447452.1596109876@warthog.procyon.org.uk>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Content-ID: <667819.1597072619.1@warthog.procyon.org.uk>
Date: Mon, 10 Aug 2020 16:16:59 +0100
Message-ID: <667820.1597072619@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for now
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Can you drop the fscache rewrite pull for now.  We've seem an issue in NFS
integration and need to rework the read helper a bit.  I made an assumption
that fscache will always be able to request that the netfs perform a read of a
certain minimum size - but with NFS you can break that by setting rsize too
small.

We need to make the read helper able to make multiple netfs reads.  This can
help ceph too.

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

