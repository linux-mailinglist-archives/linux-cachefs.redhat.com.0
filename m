Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F806652A8
	for <lists+linux-cachefs@lfdr.de>; Wed, 11 Jan 2023 05:04:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673409854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JWgRgLxn5K0CMtCFsGfba28K7O+jK+opYp/YwWzx7bk=;
	b=dcXh2YQ5Y1T0LUiuJLylmi0ZNOq9HpqpQ7tqTrKFp5Uj9oyTp1qwLN42LDLkkdVb4LJKHC
	btobtU3T/GfnSYwtwPkBBQyDFrI3GXZ8Jyvyl+/JCjZYtcSMXFjmGY81VYYKLJRHYpODnP
	Igc49Lvw+6gjRFHoAhReDVqP2G5g3QA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-wo8zdEdiPTOYYD69_vh8XA-1; Tue, 10 Jan 2023 23:04:11 -0500
X-MC-Unique: wo8zdEdiPTOYYD69_vh8XA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1794885C6E1;
	Wed, 11 Jan 2023 04:04:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED8D12026D68;
	Wed, 11 Jan 2023 04:04:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7446B1947051;
	Wed, 11 Jan 2023 04:04:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4183A1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 04:04:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 248C42166B29; Wed, 11 Jan 2023 04:04:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CB312166B26
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 04:04:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60B283803911
 for <linux-cachefs@redhat.com>; Wed, 11 Jan 2023 04:04:06 +0000 (UTC)
Received: from dggsgout12.his.huawei.com (hwsga02-in.huaweimarine.com
 [45.249.212.56]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-LrHNCA6rMh-05COYqdFC8Q-1; Tue, 10 Jan 2023 23:04:03 -0500
X-MC-Unique: LrHNCA6rMh-05COYqdFC8Q-1
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4NsDZG3QT0z4f3s61;
 Wed, 11 Jan 2023 12:03:50 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
 by APP2 (Coremail) with SMTP id Syh0CgCHeugkNb5jzwboBQ--.7168S2;
 Wed, 11 Jan 2023 12:03:51 +0800 (CST)
To: linux-cachefs@redhat.com
References: <20221226103309.953112-1-houtao@huaweicloud.com>
From: Hou Tao <houtao@huaweicloud.com>
Message-ID: <57afbcf7-df1f-47b8-2b81-8fca87487f57@huaweicloud.com>
Date: Wed, 11 Jan 2023 12:03:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20221226103309.953112-1-houtao@huaweicloud.com>
X-CM-TRANSID: Syh0CgCHeugkNb5jzwboBQ--.7168S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr15Wr1xCFWktFyxXF18Zrb_yoWDKFg_u3
 4xKas8uw40qayDKayYkFnIqrs3uw4jga18JFyDtr17G34F9rn09F1kKrySyF1Igay7ZF45
 Cr1kKFZYqr129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrR6zUUUUU
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v2 0/2] Fixes for fscache volume
 operations
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
 "houtao1@huawei.com" <houtao1@huawei.com>, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ping ?

On 12/26/2022 6:33 PM, Hou Tao wrote:
> From: Hou Tao <houtao1@huawei.com>
>
> Hi,
>
> The patchset includes two fixes for fscache volume operations: patch 1
> fixes the hang problem during volume acquisition when the volume
> acquisition process waits for the freeing of relinquished volume, patch
> 2 adds the missing memory barrier in fscache_create_volume_work() and it
> is spotted through code review when checking whether or not these is
> missing smp_mb() before invoking wake_up_bit().
>
> Comments are always welcome.
>
> Chang Log:
> v2:
>  * rebased on v6.1-rc1
>  * Patch 1: use wait_on_bit() instead (Suggested by David)
>  * Patch 2: add the missing smp_mb() in fscache_create_volume_work()
>
> v1: https://listman.redhat.com/archives/linux-cachefs/2022-December/007384.html
>
> Hou Tao (2):
>   fscache: Use wait_on_bit() to wait for the freeing of relinquished
>     volume
>   fscache: Add the missing smp_mb__after_atomic() before wake_up_bit()
>
>  fs/fscache/volume.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

