Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40F66956F
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Jan 2023 12:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673609039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O7/e50Pc4AugC4kMN3atg0d+joSnctLxXmAz5OnhfXc=;
	b=WnRdwTlr4jryVEFFALJJoxKdc1iSmr2u0eICOgmU+W0ZaCp9HnxJhJd4tKSY4NIZsrWCHZ
	THUSxJELG00ABM161thWLenP3LbHxXMr+kh+J0/oRgEkGRfMHybN+T5H3a8EoTpDG8+hZH
	4qzSm/3ax0RKIDZun+xbCrMzLk831+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-xxPDEWdgP6iTYWwMACo5ZQ-1; Fri, 13 Jan 2023 06:23:56 -0500
X-MC-Unique: xxPDEWdgP6iTYWwMACo5ZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E818285D066;
	Fri, 13 Jan 2023 11:23:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEA4F492B05;
	Fri, 13 Jan 2023 11:23:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D51AF1947058;
	Fri, 13 Jan 2023 11:23:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A999D1947056 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Jan 2023 11:23:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7EA9C2026D76; Fri, 13 Jan 2023 11:23:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7630C2026D68
 for <linux-cachefs@redhat.com>; Fri, 13 Jan 2023 11:23:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564D6185A78B
 for <linux-cachefs@redhat.com>; Fri, 13 Jan 2023 11:23:52 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-mlSqPzugN7GAd00y80nLxg-1; Fri, 13 Jan 2023 06:23:48 -0500
X-MC-Unique: mlSqPzugN7GAd00y80nLxg-1
Received: from mail02.huawei.com (unknown [172.30.67.169])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NtfDq0TTHz4f4bmq;
 Fri, 13 Jan 2023 19:23:39 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.124.27])
 by APP4 (Coremail) with SMTP id gCh0CgBXwLM6P8Fj7hGXBg--.28092S4;
 Fri, 13 Jan 2023 19:23:40 +0800 (CST)
From: Hou Tao <houtao@huaweicloud.com>
To: linux-cachefs@redhat.com
Date: Fri, 13 Jan 2023 19:52:09 +0800
Message-Id: <20230113115211.2895845-1-houtao@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBXwLM6P8Fj7hGXBg--.28092S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Xry7Zr1fWF1kJrWfur43Awb_yoW8Jr1kpr
 W3CrsxKFW8G3sxtws7Xw47Z3409FWkta9rWr15Aw1UAr45ZFWjqayUKw1Y9a42y395Aayx
 XF1Utw4fZryUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUgCb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
 0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
 vfC2KfnxnUUI43ZEXa7IU1zuWJUUUUU==
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH v3 0/2] Fixes for fscache volume operations
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
 houtao1@huawei.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hou Tao <houtao1@huawei.com>

Hi,

The patchset includes two fixes for fscache volume operations: patch 1
fixes the hang problem during volume acquisition when the volume
acquisition process waits for the freeing of relinquished volume, patch
2 adds the missing memory barrier in fscache_create_volume_work() and it
is spotted through code review when checking whether or not these is
missing smp_mb() before invoking wake_up_bit().

Comments are always welcome.

Chang Log:
v3:
 * Use clear_and_wake_up_bit() helper (Suggested by Jingbo Xu)
 * Tidy up commit message and add Reviewed-by tag

v2: https://listman.redhat.com/archives/linux-cachefs/2022-December/007402.html
 * rebased on v6.1-rc1
 * Patch 1: use wait_on_bit() instead (Suggested by David)
 * Patch 2: add the missing smp_mb() in fscache_create_volume_work()

v1: https://listman.redhat.com/archives/linux-cachefs/2022-December/007384.html


Hou Tao (2):
  fscache: Use wait_on_bit() to wait for the freeing of relinquished
    volume
  fscache: Use clear_and_wake_up_bit() in fscache_create_volume_work()

 fs/fscache/volume.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.29.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

