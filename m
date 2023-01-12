Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B396666840
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Jan 2023 02:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673485669;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=prFB9Rg7mmyqEBurkyq+R8j/BZdIsgasq+YqMGZ/fQU=;
	b=i1PT9PZYCR1rN/4B2GG4AzhvyPW7DXtE4qdnL9G0lfa3cnMKIwp9fcwdw71ko2mkwf4qmT
	fBC2qwSmHr28RRDQ6LMWFnvUOLD5Ys4JWiPQzN99Jf8sOuV+DrkATW4aLGXy7iwSDicr4W
	i4Ih7LNYaKg6ey3fPrzxc8TSxZ6W2zw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-uQQ2xJI_ORqniddOgUwFnw-1; Wed, 11 Jan 2023 20:07:47 -0500
X-MC-Unique: uQQ2xJI_ORqniddOgUwFnw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04BC6185A78B;
	Thu, 12 Jan 2023 01:07:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEB46492C14;
	Thu, 12 Jan 2023 01:07:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1A181946A7A;
	Thu, 12 Jan 2023 01:07:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EA801946A76 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 01:07:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E48DD492C18; Thu, 12 Jan 2023 01:07:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6BB492C14
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 01:07:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C087A858F09
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 01:07:44 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (hwsga01-in.huaweimarine.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-zaD9q3zRPvCZNMwZyEtbEA-1; Wed, 11 Jan 2023 20:07:42 -0500
X-MC-Unique: zaD9q3zRPvCZNMwZyEtbEA-1
Received: from mail02.huawei.com (unknown [172.30.67.153])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NsmcN63Sbz4f3k67;
 Thu, 12 Jan 2023 09:07:32 +0800 (CST)
Received: from [10.174.176.117] (unknown [10.174.176.117])
 by APP4 (Coremail) with SMTP id gCh0CgDXP7NUXb9j77E5Bg--.63722S2;
 Thu, 12 Jan 2023 09:07:35 +0800 (CST)
To: David Howells <dhowells@redhat.com>
References: <20221226103309.953112-3-houtao@huaweicloud.com>
 <20221226103309.953112-1-houtao@huaweicloud.com>
 <2431994.1673453386@warthog.procyon.org.uk>
From: Hou Tao <houtao@huaweicloud.com>
Message-ID: <cd26e985-ce9a-6011-400a-9005376f47b5@huaweicloud.com>
Date: Thu, 12 Jan 2023 09:07:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2431994.1673453386@warthog.procyon.org.uk>
X-CM-TRANSID: gCh0CgDXP7NUXb9j77E5Bg--.63722S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF4rAF15Zr1ftr1rCr1kuFg_yoW3KFb_CF
 ZYvFZYkw47W3WDK3WUtr1Sqa1xKr18C3Z3trZrJrZ7tr4xZ39IkFn7WryI9F1xG3s7KF43
 A34UWF4vyw13CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUOyCJDUUUU
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, houtao1@huawei.com, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 1/12/2023 12:09 AM, David Howells wrote:
> Hou Tao <houtao@huaweicloud.com> wrote:
>
>> fscache_create_volume_work() uses wake_up_bit() to wake up the processes
>> which are waiting for the completion of volume creation. According to
>> comments in wake_up_bit() and waitqueue_active(), an extra smp_mb() is
>> needed to guarantee the memory order between FSCACHE_VOLUME_CREATING
>> flag and waitqueue_active() before invoking wake_up_bit().
> What two values are you ordering?
>
> If we're using this to create a critical section, then yes, we would need a
> barrier to order the changes inside the critical section before changing the
> memory location that forms the lock - but this is not a critical section.
It is similar with patch #1. The smp_mb() is used for order between
volume->flags and wq->head.
> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

