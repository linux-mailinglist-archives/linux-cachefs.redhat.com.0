Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C0486BEB
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 22:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641504740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KmPI4vYvonTFmpGu4Lan26HSxdewGY62+iyQfxUYLV4=;
	b=Gn92dKqp2fuu27Qr8I+gd3Z2QPQE5eICUO6/qrkPVwTaltr3v/XH3DBcm3BDdbWJTsNi27
	p+AzG5ZEO8ARLoZdvjZLx3Jwe2TDCqiNmApWfXSgNarElmq3ODdKR2h/osbosPvy+o51ak
	J/M8bavZOUx8Xp8gD0vP65Ztp+gmZis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-G013v7rFNZGQSSN-QPrfOg-1; Thu, 06 Jan 2022 16:32:12 -0500
X-MC-Unique: G013v7rFNZGQSSN-QPrfOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B8CD802C94;
	Thu,  6 Jan 2022 21:32:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FA4656F8A;
	Thu,  6 Jan 2022 21:32:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E17AE4BB7C;
	Thu,  6 Jan 2022 21:32:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206LW2DD027208 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 16:32:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16340E2E6; Thu,  6 Jan 2022 21:32:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6083E16A39;
	Thu,  6 Jan 2022 21:31:55 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com
Date: Thu, 06 Jan 2022 21:31:54 +0000
Message-ID: <164150471440.2994594.16990036181824162931.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
	linux-cifs@vger.kernel.org
Subject: [Linux-cachefs] [RFC][PATCH v2 0/3] cifs: In-progress conversion to
 use iov_iters instead of page lists
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Steve,

For your illumination, here's where I'm currently at with making cifs use
netfslib more fully.  I ended up delving into the realms of converting it
to use iov_iter instead of page lists and doing partial foliation.

It isn't complete yet and some of the patches don't compile, but if you
want a look at what I've been doing...

David
---
David Howells (3):
      cifs: Use netfslib
      cifs: Reverse the way iov_iters are used in reading
      cifs: Eliminate pages list from cifs_readdata, cifs_writedata and smb_rqst


 fs/cifs/cifsencrypt.c |   40 +-
 fs/cifs/cifsfs.h      |    3 +
 fs/cifs/cifsglob.h    |   28 +-
 fs/cifs/cifsproto.h   |    8 +-
 fs/cifs/cifssmb.c     |  219 ++++++---
 fs/cifs/file.c        | 1041 +++++++++++++----------------------------
 fs/cifs/misc.c        |  109 -----
 fs/cifs/smb2ops.c     |  188 ++++----
 fs/cifs/smb2pdu.c     |   12 +-
 fs/cifs/transport.c   |   41 +-
 include/linux/uio.h   |    7 +
 lib/iov_iter.c        |  136 ++++++
 12 files changed, 746 insertions(+), 1086 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

