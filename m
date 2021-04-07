Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF5D93570BF
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 17:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617810426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7aZz0sneY2hi5coWIdF8RoKy4hCx9VEqKuqbkRzDwZ4=;
	b=dQeSXi51NrVWT+kcpxxwv5ua1AcPsZVuiExjBqDtopniFqhCAkIWCQdWXYglH/SEkTgry3
	HKSDM39v+w7fCrELfcGJgcMakZIl/8QmOKodIoMOJdmTJpPdtu2HbTUvGL+3XW7PZIb1y4
	oI3ACzajln1Nl89TbZB9mT6puvGAzCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-JW_lzqk0M5G8QSCJ69S9SA-1; Wed, 07 Apr 2021 11:47:04 -0400
X-MC-Unique: JW_lzqk0M5G8QSCJ69S9SA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317228030BB;
	Wed,  7 Apr 2021 15:47:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A86495C1C4;
	Wed,  7 Apr 2021 15:47:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93C411809C82;
	Wed,  7 Apr 2021 15:46:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137Fkuj3005186 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 11:46:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B6B119CAD; Wed,  7 Apr 2021 15:46:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-201.rdu2.redhat.com
	[10.10.115.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43E9D1893C;
	Wed,  7 Apr 2021 15:46:54 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: jlayton@kernel.org
Date: Wed, 07 Apr 2021 16:46:53 +0100
Message-ID: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 0/5] netfs: Fixes for the netfs lib
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


Hi Jeff,

Here's a bunch of fixes plus a tracepoint for the netfs library.  I'm going
to roll them into other patches, but I'm posting them here for separate
review.

David
---
David Howells (5):
      netfs: Fix a missing rreq put in netfs_write_begin()
      netfs: Call trace_netfs_read() after ->begin_cache_operation()
      netfs: Don't record the copy termination error
      netfs: Fix copy-to-cache amalgamation
      netfs: Add a tracepoint to log failures that would be otherwise unseen


 fs/cachefiles/io.c           | 17 ++++++++++
 fs/netfs/read_helper.c       | 58 +++++++++++++++++++---------------
 include/linux/netfs.h        |  6 ++++
 include/trace/events/netfs.h | 60 ++++++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+), 25 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

