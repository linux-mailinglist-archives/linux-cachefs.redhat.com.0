Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915E666B24
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Jan 2023 07:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673504267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TfMZgrAmHCJv9vDuIshahQRocn/kB+bRXMK5lbF6uZ0=;
	b=cpzCAFNZMI+fWdibL7yR95dO3y7zO6jKsp4iEuuiGGcODMFKuxTP206rmPkWrg6CRhg+01
	bI7Cu4snjqI3glDdKHeHi26F5exa9ps4l4LIt+WOj1RkSrQaktMcY9mQUWAxkYZJWrfpzF
	vDCvLpv1GaVn0qvCzFL3dzb26O2bcWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-I3fgGC3yM0-hYMlVYnGiqw-1; Thu, 12 Jan 2023 01:17:43 -0500
X-MC-Unique: I3fgGC3yM0-hYMlVYnGiqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 836AE811E9C;
	Thu, 12 Jan 2023 06:17:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78F04C15BA0;
	Thu, 12 Jan 2023 06:17:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D5531946A7F;
	Thu, 12 Jan 2023 06:17:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 50F831946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 06:17:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 30EDC4078904; Thu, 12 Jan 2023 06:17:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28DA14078903
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 06:17:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E124811E6E
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 06:17:41 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (hwsga01-in.huaweimarine.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-uOxOIDFDO9CFkRnBch5saw-1; Thu, 12 Jan 2023 01:17:35 -0500
X-MC-Unique: uOxOIDFDO9CFkRnBch5saw-1
Received: from mail02.huawei.com (unknown [172.30.67.153])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NsvTz5Z3Kz4f3vdy;
 Thu, 12 Jan 2023 14:17:27 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
 by APP4 (Coremail) with SMTP id gCh0CgCnXLD3pb9j6QdIBg--.57168S2;
 Thu, 12 Jan 2023 14:17:30 +0800 (CST)
To: Jingbo Xu <jefflexu@linux.alibaba.com>, linux-cachefs@redhat.com
References: <20221226103309.953112-1-houtao@huaweicloud.com>
 <20221226103309.953112-3-houtao@huaweicloud.com>
 <8b0af045-25c1-9848-3c8c-de7da94d06da@linux.alibaba.com>
From: Hou Tao <houtao@huaweicloud.com>
Message-ID: <f70cae75-d866-f70d-1fea-4213b0fb8fef@huaweicloud.com>
Date: Thu, 12 Jan 2023 14:17:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8b0af045-25c1-9848-3c8c-de7da94d06da@linux.alibaba.com>
X-CM-TRANSID: gCh0CgCnXLD3pb9j6QdIBg--.57168S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary8Gr4fXrW3Zr1DWFW3Wrg_yoW8Ww43pr
 WkWFySga18X39Fy3yDXw17u34SgrWUKan7Gr10y3WUAr4FvrWF93WSkF98ua47A395JrWx
 Z3WUK3y3XryUArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
 xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU189N3UUUUU==
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] fscache: Add the missing
 smp_mb__after_atomic() before wake_up_bit()
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
Cc: linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 1/12/2023 12:34 PM, Jingbo Xu wrote:
>
> On 12/26/22 6:33 PM, Hou Tao wrote:
>> From: Hou Tao <houtao1@huawei.com>
>>
>> fscache_create_volume_work() uses wake_up_bit() to wake up the processes
>> which are waiting for the completion of volume creation. According to
>> comments in wake_up_bit() and waitqueue_active(), an extra smp_mb() is
>> needed to guarantee the memory order between FSCACHE_VOLUME_CREATING
>> flag and waitqueue_active() before invoking wake_up_bit().
>>
>> Considering clear_bit_unlock() before wake_up_bit() is an atomic
>> operation, use smp_mb__after_atomic() instead of smp_mb() to provide
>> such guarantee.
>>
>> Signed-off-by: Hou Tao <houtao1@huawei.com>
>> ---
>>  fs/fscache/volume.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
>> index fc3dd3bc851d..734d17f404e7 100644
>> --- a/fs/fscache/volume.c
>> +++ b/fs/fscache/volume.c
>> @@ -281,6 +281,11 @@ static void fscache_create_volume_work(struct work_struct *work)
>>  				 fscache_access_acquire_volume_end);
>>  
>>  	clear_bit_unlock(FSCACHE_VOLUME_CREATING, &volume->flags);
>> +	/*
>> +	 * Paired with barrier in wait_on_bit(). Check wake_up_bit() and
>> +	 * waitqueue_active() for details.
>> +	 */
>> +	smp_mb__after_atomic();
>>  	wake_up_bit(&volume->flags, FSCACHE_VOLUME_CREATING);
>>  	fscache_put_volume(volume, fscache_volume_put_create_work);
>>  }
> LGTM.
>
> Actually I'm thinking if clear_and_wake_up_bit() could be used here.
> Ditto for patch 1.
Good idea. Just find the presence of clear_and_wake_up_bit(). Will do in v3 for
both patch 1 & patch 2.
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

