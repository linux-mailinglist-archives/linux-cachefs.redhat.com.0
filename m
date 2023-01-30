Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471B680B62
	for <lists+linux-cachefs@lfdr.de>; Mon, 30 Jan 2023 11:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675076236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CXVWUr30JyoXC6i1N2L6jZZ2O+S5pbfXbSu8QDii8co=;
	b=TpDG89/cL1FW+vgi0Qrbm/SfIjGfuUOquwP80BsxaIZpqTdUQ+gI42s8Uanb23OLfK/RW1
	TqVA3IbJVvbTUYkIcMFfoXWx6c6P7DQUccj0HbMPo2VyIg557iYdr+ZVU+Urkev0UgvT4j
	nfw3155lbKS7pAnmfLfxIuWj7o5Ys7E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-2pJ3fU6SOUSnPFEP_dEFlQ-1; Mon, 30 Jan 2023 05:57:12 -0500
X-MC-Unique: 2pJ3fU6SOUSnPFEP_dEFlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF89B1C0A58F;
	Mon, 30 Jan 2023 10:57:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E291140EBF5;
	Mon, 30 Jan 2023 10:57:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DDD0B1946594;
	Mon, 30 Jan 2023 10:57:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F8A61946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 10:57:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E8B8422F2; Mon, 30 Jan 2023 10:57:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25BAC422AE
 for <linux-cachefs@redhat.com>; Mon, 30 Jan 2023 10:57:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C579F3C0F422
 for <linux-cachefs@redhat.com>; Mon, 30 Jan 2023 10:57:08 +0000 (UTC)
Received: from dggsgout12.his.huawei.com (hwsga02-in.huaweimarine.com
 [45.249.212.56]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-4XFxYVH8O66YSp5yUNGREA-1; Mon, 30 Jan 2023 05:57:06 -0500
X-MC-Unique: 4XFxYVH8O66YSp5yUNGREA-1
Received: from mail02.huawei.com (unknown [172.30.67.169])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4P54rB47k8z4f3jHZ;
 Mon, 30 Jan 2023 18:56:58 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
 by APP1 (Coremail) with SMTP id cCh0CgAXgSt4otdjy_MHCg--.30573S2;
 Mon, 30 Jan 2023 18:56:59 +0800 (CST)
To: linux-cachefs@redhat.com, David Howells <dhowells@redhat.com>
References: <20230113115211.2895845-1-houtao@huaweicloud.com>
From: Hou Tao <houtao@huaweicloud.com>
Message-ID: <70586435-8c17-6da7-2971-3fbb3ebe6036@huaweicloud.com>
Date: Mon, 30 Jan 2023 18:56:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20230113115211.2895845-1-houtao@huaweicloud.com>
X-CM-TRANSID: cCh0CgAXgSt4otdjy_MHCg--.30573S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWkXw1xXw4UAFWUJw1UJrb_yoW8Gr1rpF
 ZxCwsIqFW8G3sayws7Ja17Z34v9FW8J397Wr15Jw4UAr4YvFWjqay5K3WY93W7C395Aayx
 XF1Utw4Sq34jkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUOyCJDUUUU
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v3 0/2] Fixes for fscache volume
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
 "houtao1@huawei.com" <houtao1@huawei.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

Could you please pick it up for v6.2 ?

On 1/13/2023 7:52 PM, Hou Tao wrote:
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
> v3:
>  * Use clear_and_wake_up_bit() helper (Suggested by Jingbo Xu)
>  * Tidy up commit message and add Reviewed-by tag
>
> v2: https://listman.redhat.com/archives/linux-cachefs/2022-December/007402.html
>  * rebased on v6.1-rc1
>  * Patch 1: use wait_on_bit() instead (Suggested by David)
>  * Patch 2: add the missing smp_mb() in fscache_create_volume_work()
>
> v1: https://listman.redhat.com/archives/linux-cachefs/2022-December/007384.html
>
>
> Hou Tao (2):
>   fscache: Use wait_on_bit() to wait for the freeing of relinquished
>     volume
>   fscache: Use clear_and_wake_up_bit() in fscache_create_volume_work()
>
>  fs/fscache/volume.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

