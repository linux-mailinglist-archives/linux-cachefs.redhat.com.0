Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30C4E8C48
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 04:46:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-_yCBL_oLOK6G6sE7cse0jw-1; Sun, 27 Mar 2022 22:46:47 -0400
X-MC-Unique: _yCBL_oLOK6G6sE7cse0jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F9AD1C04B4C;
	Mon, 28 Mar 2022 02:46:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 934B8C44AE4;
	Mon, 28 Mar 2022 02:46:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65FF11947BBC;
	Mon, 28 Mar 2022 02:46:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DCF2B19451F1 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 02:46:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A708C1121321; Mon, 28 Mar 2022 02:46:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A25E21121318
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 02:46:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67D0585A5BC
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 02:46:26 +0000 (UTC)
Received: from out199-10.us.a.mail.aliyun.com
 (out199-10.us.a.mail.aliyun.com [47.90.199.10]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-7mAuZqDCMHSXieRTKdyhzA-1; Sun, 27 Mar 2022 22:46:21 -0400
X-MC-Unique: 7mAuZqDCMHSXieRTKdyhzA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8KPT83_1648435575
Received: from 30.225.24.93(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8KPT83_1648435575) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 10:46:16 +0800
Message-ID: <9800e033-0456-b3cc-27e6-cf3d776f6feb@linux.alibaba.com>
Date: Mon, 28 Mar 2022 10:46:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com, fannaihao@baidu.com
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-11-jefflexu@linux.alibaba.com>
 <YkEgoqAKNTf45lJa@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YkEgoqAKNTf45lJa@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v6 10/22] erofs: add mode checking helper
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/28/22 10:42 AM, Gao Xiang wrote:
> On Fri, Mar 25, 2022 at 08:22:11PM +0800, Jeffle Xu wrote:
>> Until then erofs is exactly blockdev based filesystem. In other using
>> scenarios (e.g. container image), erofs needs to run upon files.
>>
>> This patch set is going to introduces a new nodev mode, in which erofs
>> could be mounted from a bootstrap blob file containing complete erofs
>> image.
>>
>> Add a helper checking which mode erofs works in.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/internal.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>> index e424293f47a2..1486e2573667 100644
>> --- a/fs/erofs/internal.h
>> +++ b/fs/erofs/internal.h
>> @@ -161,6 +161,11 @@ struct erofs_sb_info {
>>  #define set_opt(opt, option)	((opt)->mount_opt |= EROFS_MOUNT_##option)
>>  #define test_opt(opt, option)	((opt)->mount_opt & EROFS_MOUNT_##option)
>>  
>> +static inline bool erofs_is_nodev_mode(struct super_block *sb)
> 
> I've seen a lot of such
> 
> +		if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) &&
> +		    erofs_is_nodev_mode(sb)) {
> 
> usages in the followup patches, which makes me wonder if the configuration
> can be checked in the helper as well. Also maybe rename it as
> erofs_is_fscache_mode()?
> 

Sure. Will be done in the next version.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

