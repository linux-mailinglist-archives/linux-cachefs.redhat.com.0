Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3EF42029B
	for <lists+linux-cachefs@lfdr.de>; Sun,  3 Oct 2021 18:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633277663;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o+FkAbPjFd/SdTL0Dybdh8kqc9iE//pkzwMFE5K1HMs=;
	b=Bn2WSM7U6guggFqfnGnK+CA6Qimb0mdxFvhcg9rl9g7LBLYWUtFuh+OiE1riiEl5sQH9MO
	RFSJMwLQdzn5Gcz8jPzuEzgmxw7Bz+OVQ4DFG4hDy71IALwy/RompDXZ5dR5S8BXSgfCeU
	1NzJbEbUEuE9baflRAGLW4VTL+O4O2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-TKA6KWmxN_KsfsTK1h2YBw-1; Sun, 03 Oct 2021 12:14:21 -0400
X-MC-Unique: TKA6KWmxN_KsfsTK1h2YBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D6911084681;
	Sun,  3 Oct 2021 16:14:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3300A5D9D3;
	Sun,  3 Oct 2021 16:14:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D55C1809C81;
	Sun,  3 Oct 2021 16:14:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 193GEAwI012296 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 3 Oct 2021 12:14:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFA7B9AA21; Sun,  3 Oct 2021 16:14:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7BE35C1BB;
	Sun,  3 Oct 2021 16:14:05 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: dhowells@redhat.com
Date: Sun,  3 Oct 2021 12:13:59 -0400
Message-Id: <1633277640-2332-1-git-send-email-dwysocha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 0/1] Fix oops in cachefiles tracepoints due
	to NULL objects
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch fixes a couple more oops which may occur with cachefiles
tracepoints.  I've done a quick audit of the cachefiles tracepoints
and I think these are the only two remaining ones where NULL objects
may occur and thus a tracepoint can oops.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

