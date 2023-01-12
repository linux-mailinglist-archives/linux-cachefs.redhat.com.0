Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC06669D6
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Jan 2023 04:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673495917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0VjI/jYEigVF1dXP4VEA7S0E/C0D3GTaFs/tS2ExJsQ=;
	b=DC5oiNXbGMPPuXnMIQTMmof9NRFy2g+31J1SB+C9P39yjXCyyN41C0Pds4u+eFm8hlOVX/
	ZKXTn4KLPQlsXdXEExbmhlHmmItvXwF7efb5zJCEpKDSbv/2Kws2MHIsy46Jb4g470VL95
	FKOP2Ptu54z35D2m5yB/dRzmgMPRCSs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-qr_bnRfLMK6SBScq10ROBA-1; Wed, 11 Jan 2023 22:58:36 -0500
X-MC-Unique: qr_bnRfLMK6SBScq10ROBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA7DB1815CF2;
	Thu, 12 Jan 2023 03:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FFAC140EBF4;
	Thu, 12 Jan 2023 03:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 651B11946A7B;
	Thu, 12 Jan 2023 03:58:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A3061946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 03:58:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D73A84078904; Thu, 12 Jan 2023 03:58:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF25C4078903
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 03:58:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A57CE101A52E
 for <linux-cachefs@redhat.com>; Thu, 12 Jan 2023 03:58:33 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-516-dnbK3pqgP1aFahpDR5NXMw-1; Wed, 11 Jan 2023 22:58:31 -0500
X-MC-Unique: dnbK3pqgP1aFahpDR5NXMw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R251e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VZPF1qd_1673495907
Received: from 30.221.131.229(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VZPF1qd_1673495907) by smtp.aliyun-inc.com;
 Thu, 12 Jan 2023 11:58:28 +0800
Message-ID: <6acd0aea-2e7b-e30e-214f-81f4c3766ead@linux.alibaba.com>
Date: Thu, 12 Jan 2023 11:58:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: David Howells <dhowells@redhat.com>, Hou Tao <houtao@huaweicloud.com>
References: <20221226103309.953112-2-houtao@huaweicloud.com>
 <20221226103309.953112-1-houtao@huaweicloud.com>
 <2431838.1673453170@warthog.procyon.org.uk>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <2431838.1673453170@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/12/23 12:06 AM, David Howells wrote:
> Hou Tao <houtao@huaweicloud.com> wrote:
> 
>>  			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
>> +			/*
>> +			 * Paired with barrier in wait_on_bit(). Check
>> +			 * wake_up_bit() and waitqueue_active() for details.
>> +			 */
>> +			smp_mb__after_atomic();
>>  			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);
> 
> What two values are you applying a partial ordering to?

Yeah Hou Tao has explained that a full barrier is needed here to avoid
the potential reordering at the waker side.

As I was also researching on this these days, I'd like to share my
thought on this, hopefully if it could give some insight :)

Without the barrier at the waker side, it may suffer from the following
race:

```
CPU0 - waker                    CPU1 - waiter

if (waitqueue_active(wq_head)) <-- find no wq_entry in wq_head list
    wake_up(wq_head);

                                for (;;) {
                                   prepare_to_wait(...);
                                        # add wq_entry into wq_head list

                                    if (@cond)  <-- @cond is false
                                        break;
                                    schedule(); <-- wq_entry still in
                                                    wq_head list,
                                                    wait for next wakeup
                                 }
                                 finish_wait(&wq_head, &wait);

@cond = true;
```

in which case the waiter misses the wakeup for one time.

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

