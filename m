Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC1490589
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Jan 2022 10:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642413474;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zXDE+Nhf9OTiah55bTbCIoNDgGly1C5tZSvXo1xPDsY=;
	b=KUb2rWQrRs/JBZd8Y369/eGtv/nucdFMIvS4Ua3CIpn21aiBQdPCwL9BIcghBKokYzt5fS
	VaKp5tXLCgX/fr4KMw6LY9ehhFiGk+6/hmGbZmvcp0n9pJLaLKASiw8K74Yp016h5PklhO
	GQaOYWyFRYmKoat+VWPcwgNQrY11Njw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-Xxpy5BQgNjGIBvNLh3yWdg-1; Mon, 17 Jan 2022 04:57:51 -0500
X-MC-Unique: Xxpy5BQgNjGIBvNLh3yWdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF39183DD20;
	Mon, 17 Jan 2022 09:57:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 526E97039E;
	Mon, 17 Jan 2022 09:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6150D1809CB9;
	Mon, 17 Jan 2022 09:57:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20H9vcUb005014 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 04:57:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B46957B9E8; Mon, 17 Jan 2022 09:57:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7227B9E5;
	Mon, 17 Jan 2022 09:57:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Mon, 17 Jan 2022 09:57:17 +0000
Message-ID: <2752208.1642413437@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Peter Zijlstra <peterz@infradead.org>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>,
	linux-cifs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
	linux-fsdevel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] Out of order read() completion and buffer filling
	beyond returned amount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2752207.1642413437.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Al, Linus,

Do you have an opinion on whether it's permissible for a filesystem to write
into the read() buffer beyond the amount it claims to return, though still
within the specified size of the buffer?

I'm working on common DIO routines for 9p, afs, ceph and cifs in netfs lib,
and I can see that at least three of those four filesystems either can or must
split a read, possibly being required to distribute across multiple servers.

If a filesystem was to emit multiple read RPCs in parallel, there is the
possibility that they would complete out of order - particularly if they go to
multiple servers.

Would it be a violation of the way the read() family of syscalls work to write
the data into the buffers out of order, and then abandon the extra data
written at the end if one of the RPCs returned a short read?  We would have
clobbered some of the buffer that we haven't said we've modified.

For buffered reads, it's not a problem as we can fill the pagecache out of
order with no issue.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

