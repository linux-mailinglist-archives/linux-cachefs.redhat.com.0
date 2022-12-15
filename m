Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F223064D7BB
	for <lists+linux-cachefs@lfdr.de>; Thu, 15 Dec 2022 09:28:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671092935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KI+kQhK2EunM+nzyCItvHAYDxMKpZNapMEleRr0W16c=;
	b=PUGxqyN2uObkcF51kIUtfZ6h5dh3wy9w7/GDblaMnP4Gr81MhXYHVv8S8Ls0vz1y01wNIm
	p7Mac5UWJVslYsmJzOpnGJwcf8SdL03DrCTpbFWPNIwDx4nyn22zOtrovWdqCpdWHsl/46
	+PVQx5YB/HJJu1XuEMs2L7nEoh/Ydzw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-3jpCPa1TOue4Y-bJvgD8ZA-1; Thu, 15 Dec 2022 03:28:51 -0500
X-MC-Unique: 3jpCPa1TOue4Y-bJvgD8ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 010D83C01DE7;
	Thu, 15 Dec 2022 08:28:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1935F4085721;
	Thu, 15 Dec 2022 08:28:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BEC401946A6C;
	Thu, 15 Dec 2022 08:28:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D79DB19465B2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 15 Dec 2022 08:28:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D1811121315; Thu, 15 Dec 2022 08:28:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DC81121314
 for <linux-cachefs@redhat.com>; Thu, 15 Dec 2022 08:28:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4715F10119EB
 for <linux-cachefs@redhat.com>; Thu, 15 Dec 2022 08:28:46 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-O-gOM_p0NWKuwulnMdw2rQ-1; Thu, 15 Dec 2022 03:28:40 -0500
X-MC-Unique: O-gOM_p0NWKuwulnMdw2rQ-1
Received: from mail02.huawei.com (unknown [172.30.67.153])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NXlk93H84z4f3lX8;
 Thu, 15 Dec 2022 16:28:33 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
 by APP4 (Coremail) with SMTP id gCh0CgB359Sw2ppjBKcRCQ--.35114S2;
 Thu, 15 Dec 2022 16:28:36 +0800 (CST)
From: Hou Tao <houtao@huaweicloud.com>
To: David Howells <dhowells@redhat.com>
References: <42b33792-50e9-77d7-4d3e-ac5ce1adeda6@huaweicloud.com>
 <20221128031929.3918348-1-houtao@huaweicloud.com>
 <2308529.1670585211@warthog.procyon.org.uk>
Message-ID: <e6a23517-63fa-6381-1f2b-80e764252e0b@huaweicloud.com>
Date: Thu, 15 Dec 2022 16:28:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2308529.1670585211@warthog.procyon.org.uk>
X-CM-TRANSID: gCh0CgB359Sw2ppjBKcRCQ--.35114S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1UWF4UCryDZrWxAw4kCrg_yoW8Zw1fp3
 yj9Fyftws7X3Wqv3yDJw18uF4SgFn0yw4ru3yrCFZrC345KryfuF1fGayDCay8urs5Wr15
 tF4UG398CFyqqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH] fscache: Use wake_up_var() to wake up
 pending volume acquisition
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
 linux-cachefs@redhat.com, "houtao1@huawei.com" <houtao1@huawei.com>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

Sorry for the late reply. Busy for other business in work.

On 12/9/2022 7:26 PM, David Howells wrote:
> Hou Tao <houtao@huaweicloud.com> wrote:
>
>>>  			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
> Maybe this should be clear_bit_unlock() instead.
I'm not sure about that. In my understanding, clear_bit_unlock() is usually
paired with test_and_set_bit_lock() to implement bit lock to make sure the
writes before clear_bit_unlock() are visible to read access in concurrent
process, right ? But now the caller of fscache_wake_pending_volume() only modify
cursor->flags and nothing else, so I don't think it is needed here.
If its intended purpose is to provide the missing smp_mb() for wake_up_bit(), I
also don't think it is right, because the release barrier provided by
clear_bit_unlock() doesn't guarantee the order of cursor->flags and wq_head, so
I think one extra smp_mb_after_atomic() is also needed after
clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags).

If the above reasoning makes sense to you, I think we also need to add
smp_mb_after_atomic() for wake_up_bit() in fscache_create_volume_work().
> And I wonder if:
>
> 	set_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &candidate->flags);
>
> in fscache_hash_volume() needs a barrier before it.
I also don't get it. The barrier is used to guarantee the order between
cursor->flags and candidate->flags, right ? But the write and read of
cursor->flags and candidate->flags are protected by the same hash lock.
>
>>> -			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);
>>> +			/*
>>> +			 * Paired with barrier in wait_var_event(). Check
>>> +			 * waitqueue_active() and wake_up_var() for details.
>>> +			 */
>>> +			smp_mb__after_atomic();
>>> +			wake_up_var(&cursor->flags);
> That doesn't seem right.
>
> wake_up_bit() is more selective, so should be preferred to wake_up_var().
OK. Will update fscache_wait_on_volume_collision() to use wait_on_bit() accordingly.
> David
>
>
> .

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

