Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6D4711F4
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Dec 2021 06:33:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-SwFZa__8N2m1q5MrhLNBRw-1; Sat, 11 Dec 2021 00:33:07 -0500
X-MC-Unique: SwFZa__8N2m1q5MrhLNBRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82F041006AA4;
	Sat, 11 Dec 2021 05:33:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5776277BF4;
	Sat, 11 Dec 2021 05:33:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C36AC4BB7C;
	Sat, 11 Dec 2021 05:33:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BB5X2PT015576 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 11 Dec 2021 00:33:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD75F2026D2F; Sat, 11 Dec 2021 05:33:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B93572026D46
	for <linux-cachefs@redhat.com>; Sat, 11 Dec 2021 05:32:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC4EB80A0AF
	for <linux-cachefs@redhat.com>; Sat, 11 Dec 2021 05:32:59 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
	(out30-57.freemail.mail.aliyun.com [115.124.30.57]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-442-2ABMzAFdMvCvRgDf8PqRig-1; Sat, 11 Dec 2021 00:32:56 -0500
X-MC-Unique: 2ABMzAFdMvCvRgDf8PqRig-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-DjWG1_1639200767
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-DjWG1_1639200767) by smtp.aliyun-inc.com(127.0.0.1);
	Sat, 11 Dec 2021 13:32:48 +0800
Message-ID: <aff937a0-b8fb-b9fc-22ef-d0099b392461@linux.alibaba.com>
Date: Sat, 11 Dec 2021 13:32:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: David Howells <dhowells@redhat.com>
References: <20211210073619.21667-3-jefflexu@linux.alibaba.com>
	<20211210073619.21667-1-jefflexu@linux.alibaba.com>
	<269788.1639134293@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <269788.1639134293@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [RFC 02/19] cachefiles: implement key scheme
	for demand-read mode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/10/21 7:04 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> Thus simplify the logic of placing backing files, in which backing files
>> are under "cache/<volume>/" directory directly.
> 
> You then have a scalability issue on the directory inode lock - and there may
> also be limits on the capacity of a directory.  The hash function is meant to
> work the same, no matter the cpu arch, so you should be able to copy that to
> userspace and derive the hash yourself.

Yes, as described in the cover letter, I plan to make the hashing
algorithm used by cachefiles built-in into our user daemon, so that the
user daemon could place the blob file on the right place. Then the core
logic of cachefiles won't be touched as much as possible.

> 
>> Also skip coherency checking currently to ease the development and debug.
> 
> Better if you can do that in erofs rather than cachefiles.  Just set your
> coherency data to all zeros or something.
> 

Yes it is preferred to keep the general part of cachefiles untouched.
Later we can set "CacheFiles.cache" xattr on blob files in advance to
pass this check.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

