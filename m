Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270C58D95B
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Aug 2022 15:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660051652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2TLQ0s5NV8w+yisy87b1St5hNXbIOUry2YMYnfMP0qk=;
	b=RVoyby9Q0IjEqEAdCYnDXxmzZIDab454/eDWYmYK3vCbV603RWgXJrjbmNIJqwBfovLHG+
	X5aPEfVC311es5D2VufC9VjYSy3bjRFMPTrDXZFUEbogMd5senckwsnYwZL1qihSs1cpJT
	A4zLFsvMl+ieNiouJcl/kBcLJNeUffc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-8tL5SyjyNHScVVXLlIX-9w-1; Tue, 09 Aug 2022 09:27:30 -0400
X-MC-Unique: 8tL5SyjyNHScVVXLlIX-9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EADD80A0B9;
	Tue,  9 Aug 2022 13:27:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0DF1121315;
	Tue,  9 Aug 2022 13:27:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34FA21946A4E;
	Tue,  9 Aug 2022 13:27:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF36B1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  9 Aug 2022 13:27:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B973A40CFD0E; Tue,  9 Aug 2022 13:27:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F20D740CFD0B;
 Tue,  9 Aug 2022 13:27:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Tue, 09 Aug 2022 14:27:25 +0100
Message-ID: <431242.1660051645@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [GIT PULL]
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <431241.1660051645.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Can you pull these two patches please?  The first fixes a cookie access ref
leak if a cookie is invalidated a second time before the first invalidation
is actually processed.  The second adds a tracepoint to log cookie look up
failure.

Thanks,
David

Link: https://listman.redhat.com/archives/linux-cachefs/2022-August/007061.html
Link: https://listman.redhat.com/archives/linux-cachefs/2022-August/007062.html
---
The following changes since commit 3d7cb6b04c3f3115719235cc6866b10326de34cd:

  Linux 5.19 (2022-07-31 14:03:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220809

for you to fetch changes up to 1a1e3aca9d4957e282945cdc2b58e7c560b8e0d2:

  fscache: add tracepoint when failing cookie (2022-08-09 14:13:59 +0100)

----------------------------------------------------------------
fscache fixes

----------------------------------------------------------------
Jeff Layton (2):
      fscache: don't leak cookie access refs if invalidation is in progress or failed
      fscache: add tracepoint when failing cookie

 fs/fscache/cookie.c            | 9 +++++++--
 include/trace/events/fscache.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

