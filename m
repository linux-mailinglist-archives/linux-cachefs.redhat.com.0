Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF54F6E2D
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mcnnhyjv6rBJNbbBGOLkd4DiMxhguRiB43OKlVRJp7w=;
	b=hT4V3wMI9S1L49IFax6VucFGEdUAxE1eiyvNKg0meayXKPl7DV1j9lR1FDLGVyHvoYM7Db
	HwscFlIE8PcQSVSk/RSxDIhNNZYqyNh34ndVT80yqVc6nRMkVO3NtCaiTViuJd71jPZqdZ
	QFoMMrPWVTyFiwnlevu/BN2ZltCeFGk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-iVNdW1jMMVS1UMmW2lySuA-1; Wed, 06 Apr 2022 19:03:06 -0400
X-MC-Unique: iVNdW1jMMVS1UMmW2lySuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62BED1C05B1A;
	Wed,  6 Apr 2022 23:02:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61EB0C28109;
	Wed,  6 Apr 2022 23:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C3191940372;
	Wed,  6 Apr 2022 23:02:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CCE39194034B for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:02:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9594C2024CAE; Wed,  6 Apr 2022 23:02:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EFCC2024CBB;
 Wed,  6 Apr 2022 23:02:31 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:02:30 +0100
Message-ID: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 00/14] cifs: Iterators, netfslib and folios
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a set of patches to make the following changes to the cifs
filesystem driver:

 (1) Convert cifs to use I/O iterators to pass data/buffers from the the VM
     interface layer down to the socket rather than passing page lists
     about.

 (2) Convert cifs to use netfslib for buffered and direct read operations.

 (3) A partial conversion to folios.

This branch is built on top of my netfs-lib branch[1].

The patches can be found here also:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=cifs-experimental


David

Link: https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-lib [1]
---
David Howells (14):
      cifs: Add some helper functions
      cifs: Add a function to read into an iter from a socket
      cifs: Check the IOCB_DIRECT flag, not O_DIRECT
      cifs: Change the I/O paths to use an iterator rather than a page list
      cifs: Remove unused code
      cifs: Use netfslib to handle reads
      cifs: Share server EOF pos with netfslib
      netfs: Allow the netfs to make the io (sub)request alloc larger
      cifs: Put credits into cifs_io_subrequest, not on the stack
      cifs: Hold the open file on netfs_io_request, not netfs_io_subrequest
      cifs: Clamp length according to credits and rsize
      cifs: Expose netfs subrequest debug ID and index in read tracepoints
      cifs: Split the smb3_add_credits tracepoint
      mm, netfs, fscache: Stop read optimisation when folio removed from pagecache


 fs/afs/file.c           |    1 +
 fs/afs/inode.c          |    1 +
 fs/afs/internal.h       |    2 +
 fs/cifs/Kconfig         |    1 +
 fs/cifs/cifsencrypt.c   |   40 +-
 fs/cifs/cifsfs.c        |   11 +-
 fs/cifs/cifsfs.h        |    6 +-
 fs/cifs/cifsglob.h      |   53 +-
 fs/cifs/cifsproto.h     |   13 +-
 fs/cifs/cifssmb.c       |  252 +++--
 fs/cifs/connect.c       |   18 +-
 fs/cifs/file.c          | 2096 ++++++++++-----------------------------
 fs/cifs/fscache.c       |  120 +--
 fs/cifs/fscache.h       |   70 --
 fs/cifs/inode.c         |   22 +-
 fs/cifs/misc.c          |  109 --
 fs/cifs/smb2ops.c       |  387 ++++----
 fs/cifs/smb2pdu.c       |   85 +-
 fs/cifs/smb2proto.h     |    2 +-
 fs/cifs/trace.h         |  151 ++-
 fs/cifs/transport.c     |   41 +-
 fs/netfs/internal.h     |    1 +
 fs/netfs/io.c           |    7 +-
 fs/netfs/misc.c         |   13 +-
 fs/netfs/stats.c        |    9 +-
 include/linux/fs.h      |    2 +
 include/linux/netfs.h   |    1 +
 include/linux/pagemap.h |    1 +
 mm/filemap.c            |   15 +
 29 files changed, 1203 insertions(+), 2327 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

