Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FCB4C9475
	for <lists+linux-cachefs@lfdr.de>; Tue,  1 Mar 2022 20:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646163517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j+gV+e0BTBNbAGuNHzV5hCxAL5tKJWnTAiSIV4U7LOk=;
	b=d1HBIWY5vk3VZWv2stOl9rZorbmLnVYooxmMWENll0nVfYyI8fLWT1NIBiwVYf3v1H/3Cj
	AVm3Hp2mx28VDtJrAWmqcTNECirdPVX1CiwjQ1CA8DiAGeViTnD82mGOO/5E1UeCNjeyb2
	yUEqEOEJyun604RZOEpOFfswap7ob+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-BWOtXqf9PMyydNSizCIHBA-1; Tue, 01 Mar 2022 14:38:33 -0500
X-MC-Unique: BWOtXqf9PMyydNSizCIHBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB7D835DE2;
	Tue,  1 Mar 2022 19:38:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCE234BC5F;
	Tue,  1 Mar 2022 19:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 167041809CB2;
	Tue,  1 Mar 2022 19:38:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 221JcLuL020325 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 1 Mar 2022 14:38:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0671EADCE; Tue,  1 Mar 2022 19:38:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.9.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3BB5DAA5;
	Tue,  1 Mar 2022 19:37:28 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Tue,  1 Mar 2022 14:37:23 -0500
Message-Id: <20220301193727.18847-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 0/4] Cleanups for NFS fscache and convert
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a re-post of these patches, unchanged from previous postings [1][2],
rebased on top of 5.17-rc5.

The patches were dependent on dhowells patchset which was taken in the
last merge window, so they apply on 5.17-rc5 cleanly now.

[1] https://marc.info/?l=linux-nfs&m=164225455702418&w=2
[2] https://marc.info/?l=linux-nfs&m=163976362831065&w=2

Dave Wysochanski (4):
  NFS: Cleanup usage of nfs_inode in fscache interface
  NFS: Rename fscache read and write pages functions
  NFS: Replace dfprintks with tracepoints in fscache read and write page functions
  NFS: Remove remaining dfprintks related to fscache and remove NFSDBG_FSCACHE

 fs/nfs/fscache.c            | 53 +++++++--------------
 fs/nfs/fscache.h            | 45 ++++++++----------
 fs/nfs/nfstrace.h           | 91 +++++++++++++++++++++++++++++++++++++
 fs/nfs/read.c               |  4 +-
 include/uapi/linux/nfs_fs.h |  2 +-
 5 files changed, 130 insertions(+), 65 deletions(-)

-- 
2.27.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

