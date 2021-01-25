Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 39411302E6A
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jan 2021 22:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611611699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pdPOCrZazuydN5YXMflr+xPn+iYgZifqoL1qRX1lVww=;
	b=LJ3Rd7rxvcqQP2+jH9IyWL0p7A+3KLOgXkAlk/wPGtyk8yzLuT0u6jTrXeXmhJIxUd/gUY
	2rJQI4IULbsgKqZRA6yR7XCNDlAAZnQlbKYENnWNShkT5j1TBgRdHrwXXlK1xuPeRU8ECn
	ozehpghF8jyph7QDRZvlUAXQQxSSciM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-qVCi4GwHOgyIcxTgNtXO0w-1; Mon, 25 Jan 2021 16:54:57 -0500
X-MC-Unique: qVCi4GwHOgyIcxTgNtXO0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4589515723;
	Mon, 25 Jan 2021 21:54:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 226EA5D9DB;
	Mon, 25 Jan 2021 21:54:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEA05180954D;
	Mon, 25 Jan 2021 21:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PLrGXr031150 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 16:53:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C8F95D736; Mon, 25 Jan 2021 21:53:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2B185D6DC;
	Mon, 25 Jan 2021 21:53:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
MIME-Version: 1.0
Date: Mon, 25 Jan 2021 21:53:10 +0000
Message-ID: <2541781.1611611590@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: [Linux-cachefs] Adding my fscache-next branch to linux-next
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2541780.1611611590.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Stephen,

Could you add my fscache-next branch, which is in this repo:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git

to linux-next please?

Note that it might conflict with anything Trond and/or Anna ask you to pull
for NFS, in which case I'll drop the NFS patches from it and seek to get Trond
and Anna to take them into the NFS tree.

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

