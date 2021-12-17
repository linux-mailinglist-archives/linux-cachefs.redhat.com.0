Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFC479329
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 18:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639763683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aulEocZDf0Sh0+3ssCL2j/r4Z0Bj8QMA6ffYxYYDaB8=;
	b=A8a61o4RYZRFZgTiqFrIdp3g3tCq07yo+t37BNIjfsMz1amKwX43pIHW8q8kwBOWycVseq
	InZJ2eOzoxMeXamPr83KK17fuenfG8FyhgVknWthJW4UwW2s68B1gzg2UZXvS7Po3Xpa4i
	8qb7g4XuqiUiUbwGn+41XdKIHj+wFCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-pAZGT3RgOZOUTo1gHzHIuw-1; Fri, 17 Dec 2021 12:54:40 -0500
X-MC-Unique: pAZGT3RgOZOUTo1gHzHIuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C847681CCB6;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B95D678C1C;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81D8D4A705;
	Fri, 17 Dec 2021 17:54:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHHsViB007926 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 12:54:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 464351037F3D; Fri, 17 Dec 2021 17:54:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.133])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4912D1037F39;
	Fri, 17 Dec 2021 17:54:27 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
Date: Fri, 17 Dec 2021 12:54:21 -0500
Message-Id: <1639763665-4917-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2 0/4] Cleanups for NFS fscache and convert
	from dfprintk to trace events
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a second version of a series posted previously [1]
These ran into conflicts [2] with dhowell's fscache-rewrite patches [3],
and they probably should go in his fscache-rewrite.  Note that a couple
patches have been either dropped or folded into other patches, so there's
only 4 patches left from the original 7.

The patches are also at:
https://github.com/DaveWysochanskiRH/kernel/tree/fscache-rewrite-plus-nfs

Changes since v1
- Rebase on top of dhowells fscache-rewrite (v3) and Anna's linux-next to
avoid future conflicts
- Fold in "NFS: Use nfs_i_fscache() consistently within NFS fscache code"
to other patches
- Drop "NFS: Convert NFS fscache enable/disable dfprintks to tracepoints"
since we can use fscache trace events
- Combine the last two patches into one:
NFS: Remove remaining dfprintks related to fscache cookies
NFS: Remove remaining usages of NFSDBG_FSCACHE
- Dropped Signed-off-by and Reviewed-by tags due to rebase

[1] https://marc.info/?l=linux-nfs&m=163718744111509&w=2
[2] https://marc.info/?l=linux-nfs&m=163974120915758&w=2
[3] https://marc.info/?l=linux-nfs&m=163967071213398&w=2

Dave Wysochanski (4):
  NFS: Cleanup usage of nfs_inode in fscache interface and handle i_size
    properly
  NFS: Rename fscache read and write pages functions
  NFS: Replace dfprintks with tracepoints in fscache read and write page
    functions
  NFS: Remove remaining dfprintks related to fscache and remove
    NFSDBG_FSCACHE

 fs/nfs/fscache.c            | 53 +++++++++-----------------
 fs/nfs/fscache.h            | 45 ++++++++++------------
 fs/nfs/nfstrace.h           | 91 +++++++++++++++++++++++++++++++++++++++++++++
 fs/nfs/read.c               |  4 +-
 include/uapi/linux/nfs_fs.h |  2 +-
 5 files changed, 130 insertions(+), 65 deletions(-)

-- 
1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

