Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0562666B1A
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Jan 2023 07:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673503967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nJUGJG60M/JqiOElEejLWhARYsvoXyDnjVJIui1C1Vw=;
	b=Oo9PdmaDFvpoJirCcIGOPEZVSxqlAuIWI7NvMLQAAAHf97AGb8YLzaZVMOKn1niJs36q6Z
	DIosLn19FG3Myjr8R1wlWtpjbJrF/r6LkL7LxT/gZC+U0cCYLaifC9+MCJ2xmN+B69lCnZ
	HRgV+QxYMG6cSZOYzR1QM8VfG2Xz4LM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-Q1RQid0sPoW253YOk6ddNQ-1; Thu, 12 Jan 2023 01:12:44 -0500
X-MC-Unique: Q1RQid0sPoW253YOk6ddNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 037513C01DF5;
	Thu, 12 Jan 2023 06:12:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 661C4C15BA0;
	Thu, 12 Jan 2023 06:12:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 401901946A7D;
	Thu, 12 Jan 2023 06:12:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 968171946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 06:12:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79B9F422FE; Thu, 12 Jan 2023 06:12:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7195743FBB
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 06:12:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B4629A9D35
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 06:12:41 +0000 (UTC)
Received: from dggsgout12.his.huawei.com (hwsga02-in.huaweimarine.com
 [45.249.212.56]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-PtdLpSjQONqBa8Wf7Dec7g-1; Thu, 12 Jan 2023 01:12:36 -0500
X-MC-Unique: PtdLpSjQONqBa8Wf7Dec7g-1
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4NsvN70xjRz4f3v71;
 Thu, 12 Jan 2023 14:12:23 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
 by APP2 (Coremail) with SMTP id Syh0CgAHrerGpL9jJ4AuBg--.8635S2;
 Thu, 12 Jan 2023 14:12:25 +0800 (CST)
To: Jingbo Xu <jefflexu@linux.alibaba.com>, David Howells <dhowells@redhat.com>
References: <20221226103309.953112-2-houtao@huaweicloud.com>
 <20221226103309.953112-1-houtao@huaweicloud.com>
 <2431838.1673453170@warthog.procyon.org.uk>
 <6acd0aea-2e7b-e30e-214f-81f4c3766ead@linux.alibaba.com>
From: Hou Tao <houtao@huaweicloud.com>
Message-ID: <087d25cc-97b6-7daf-3722-65fba86aaf1d@huaweicloud.com>
Date: Thu, 12 Jan 2023 14:12:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6acd0aea-2e7b-e30e-214f-81f4c3766ead@linux.alibaba.com>
X-CM-TRANSID: Syh0CgAHrerGpL9jJ4AuBg--.8635S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW5JF4UZw4rAF4DAry7Wrg_yoW8Gr1Dpr
 ZYga4UXFWktr42y397tw17Z3yYgw15Wrs3Cw1fGrZrCF15WrySkFn3KFs8CF1Uuan5Jr1F
 qw45A3sxtFsYvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWE__UUUUU=
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
Subject: Re: [Linux-cachefs] [PATCH v2 1/2] fscache: Use wait_on_bit() to
 wait for the freeing of relinquished volume
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
Cc: linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 houtao1@huawei.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 1/12/2023 11:58 AM, Jingbo Xu wrote:
>
> On 1/12/23 12:06 AM, David Howells wrote:
>> Hou Tao <houtao@huaweicloud.com> wrote:
>>
>>>  			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
>>> +			/*
>>> +			 * Paired with barrier in wait_on_bit(). Check
>>> +			 * wake_up_bit() and waitqueue_active() for details.
>>> +			 */
>>> +			smp_mb__after_atomic();
>>>  			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);
>> What two values are you applying a partial ordering to?
> Yeah Hou Tao has explained that a full barrier is needed here to avoid
> the potential reordering at the waker side.
>
> As I was also researching on this these days, I'd like to share my
> thought on this, hopefully if it could give some insight :)
>
> Without the barrier at the waker side, it may suffer from the following
> race:
>
> ```
> CPU0 - waker                    CPU1 - waiter
>
> if (waitqueue_active(wq_head)) <-- find no wq_entry in wq_head list
>     wake_up(wq_head);
>
>                                 for (;;) {
>                                    prepare_to_wait(...);
>                                         # add wq_entry into wq_head list
>
>                                     if (@cond)  <-- @cond is false
>                                         break;
>                                     schedule(); <-- wq_entry still in
>                                                     wq_head list,
>                                                     wait for next wakeup
>                                  }
>                                  finish_wait(&wq_head, &wait);
>
> @cond = true;
> ```
>
> in which case the waiter misses the wakeup for one time.
Thanks for the details annotation. It is exactly what I tried to say but failed to.
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

