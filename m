Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053C680E70
	for <lists+linux-cachefs@lfdr.de>; Mon, 30 Jan 2023 14:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675083910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A4WhzvLT89lEQwiyHvKEugHKSDhFMZeYhI2luhBEYEw=;
	b=HL2BMW3BKoCGH0Yyw7oGnW4s7/cAksKxWkqiV+wFOL9lrrLOqsnuUHUnUe2qaSLViWX6gh
	8SheAHafvbvuS9pDMMc6FQTiIMu7hoAPnrDUOj08vDVjXNt3bgggSi5+KeLKRA8JA63UdB
	v73VYdxGG+VU5W7wiAdbBAxBnnNiCRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-IAzBGH5ONg65GSSf6wHZIw-1; Mon, 30 Jan 2023 08:05:06 -0500
X-MC-Unique: IAzBGH5ONg65GSSf6wHZIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 597E3858F09;
	Mon, 30 Jan 2023 13:05:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2A331121318;
	Mon, 30 Jan 2023 13:05:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 430E21946595;
	Mon, 30 Jan 2023 13:04:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8575C1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 13:04:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 493A02166B2A; Mon, 30 Jan 2023 13:04:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D3742166B29;
 Mon, 30 Jan 2023 13:04:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Mon, 30 Jan 2023 13:04:43 +0000
Message-ID: <3425804.1675083883@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [GIT PULL] fscache: Fix incorrect mixing of
 wake/wait and missing barriers
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, houtao1@huawei.com,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3425803.1675083883.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you pull these fixes from Hou Tao please?  There are two problems
fixed in fscache volume handling:

 (1) wake_up_bit() is incorrectly paired with wait_var_event().  The latter
     selects the waitqueue to use differently.

 (2) Missing barriers ordering between state bit and task state.

Thanks,
David

To quote Hou Tao:

    The patchset includes two fixes for fscache volume operations: patch 1
    fixes the hang problem during volume acquisition when the volume
    acquisition process waits for the freeing of relinquished volume, patch
    2 adds the missing memory barrier in fscache_create_volume_work() and it
    is spotted through code review when checking whether or not these is
    missing smp_mb() before invoking wake_up_bit().

    Change Log:
    v3:
     * Use clear_and_wake_up_bit() helper (Suggested by Jingbo Xu)
     * Tidy up commit message and add Reviewed-by tag

    v2: https://listman.redhat.com/archives/linux-cachefs/2022-December/007402.html
     * rebased on v6.1-rc1
     * Patch 1: use wait_on_bit() instead (Suggested by David)
     * Patch 2: add the missing smp_mb() in fscache_create_volume_work()

    v1: https://listman.redhat.com/archives/linux-cachefs/2022-December/007384.html

Link: https://lore.kernel.org/r/20230113115211.2895845-1-houtao@huaweicloud.com
---
The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700:

  Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20230130

for you to fetch changes up to 3288666c72568fe1cc7f5c5ae33dfd3ab18004c8:

  fscache: Use clear_and_wake_up_bit() in fscache_create_volume_work() (2023-01-30 12:51:54 +0000)

----------------------------------------------------------------
fscache fixes

----------------------------------------------------------------
Hou Tao (2):
      fscache: Use wait_on_bit() to wait for the freeing of relinquished volume
      fscache: Use clear_and_wake_up_bit() in fscache_create_volume_work()

 fs/fscache/volume.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

