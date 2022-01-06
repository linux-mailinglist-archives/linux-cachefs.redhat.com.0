Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685148693E
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 18:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641491912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cw9bOd3LloJOkioocsvKV4Aj5iAutbkUOS3+3dknsZ8=;
	b=AGBTOSjXkLiVaZrCgFrQG0EhL1kfiMgPYkoIqF6WADY3N4J3ju16ghASwbMboFyolKM4p/
	8fmDrtj9QC7UUfYIGGcqhdjRtNbthes1zJxCIGVOJbb0wfqWbOdHNLd6OHDPAcwNi0KGrj
	i2ZCsX1karAV2Nb/6odgLQbfId4nU6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-1dTveUNiMTSifZS-4LhT-w-1; Thu, 06 Jan 2022 12:58:29 -0500
X-MC-Unique: 1dTveUNiMTSifZS-4LhT-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45414190A7A0;
	Thu,  6 Jan 2022 17:58:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D2B7EA28;
	Thu,  6 Jan 2022 17:58:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DE644CA9B;
	Thu,  6 Jan 2022 17:58:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206HwOjV011515 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 12:58:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D54F1091EF7; Thu,  6 Jan 2022 17:58:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C5381091EF6;
	Thu,  6 Jan 2022 17:58:20 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com
Date: Thu, 06 Jan 2022 17:58:19 +0000
Message-ID: <164149189935.2867367.12096515579793121868.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
	linux-cifs@vger.kernel.org
Subject: [Linux-cachefs] (no subject)
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

[RFC][PATCH 0/3] cifs: In-progress conversion to use iov_iters instead of page lists
Date: 


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
      cifs: Eliminate cifs_readdata::pages


 fs/cifs/cifsfs.h    |    3 +
 fs/cifs/cifsglob.h  |   28 +-
 fs/cifs/cifsproto.h |    8 +-
 fs/cifs/cifssmb.c   |  219 +++++----
 fs/cifs/file.c      | 1041 ++++++++++++++-----------------------------
 fs/cifs/misc.c      |  109 -----
 fs/cifs/smb2ops.c   |  132 +++---
 fs/cifs/smb2pdu.c   |   12 +-
 fs/cifs/transport.c |   41 +-
 include/linux/uio.h |    3 +
 lib/iov_iter.c      |   94 ++++
 11 files changed, 647 insertions(+), 1043 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

