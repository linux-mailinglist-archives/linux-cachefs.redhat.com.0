Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3540F50A51C
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Apr 2022 18:21:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-ZfsYtHooOWaZm1MFTrMdJA-1; Thu, 21 Apr 2022 12:20:58 -0400
X-MC-Unique: ZfsYtHooOWaZm1MFTrMdJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7373E1014A6B;
	Thu, 21 Apr 2022 16:20:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 317232026E03;
	Thu, 21 Apr 2022 16:20:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DABEC1940347;
	Thu, 21 Apr 2022 16:20:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B65C519451EF for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Apr 2022 16:20:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7BD1C28131; Thu, 21 Apr 2022 16:20:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F42C2812A
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 16:20:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A3C53C16192
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 16:20:53 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-jvqk5NjIMxOUP3JN0KwjNw-1; Thu, 21 Apr 2022 12:20:49 -0400
X-MC-Unique: jvqk5NjIMxOUP3JN0KwjNw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VAgYtNo_1650557669
Received: from 30.15.235.48(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VAgYtNo_1650557669) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 22 Apr 2022 00:14:31 +0800
Message-ID: <2067a5c7-4e24-f449-4676-811d12e9ab72@linux.alibaba.com>
Date: Fri, 22 Apr 2022 00:14:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220415123614.54024-3-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
 <1447543.1650552898@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1447543.1650552898@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] EMFILE/ENFILE mitigation needed in erofs?
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/21/22 10:54 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> +	fd_install(fd, file);
> 
> Do you need to mitigate potential EMFILE/ENFILE problems?  You're potentially
> trebling up the number of accounted systemwide fds: one for erofs itself, one
> anonfd per cache object file to communicate with the daemon and one in the
> daemon to talk to the server.  Cachefiles has a fourth internally, but it's
> kept off the books - further, cachefiles closes them fairly quickly after a
> period of nonuse.
> 

Hi, thanks for pointing it out.

1. Actually in our using scenarios, one erofs filesystem is formed of
several chunk-deduplicated blobs (which are really cached by
Cachefiles), while each blob can contain many files of erofs. For
example, one container image for node.js will correspond to ~20 blob
files in total. Only these blob files are cached by Cachefiles. In
densely employed environment, there could be hundreds of containers and
thus thousands of backing files on one machine. That is, only tens of
thousands of fds/files is needed in this case.

2. Our user daemon will configure rlimit-nofile to a reasonably large
(e.g. 1 million) value, so that it won't fail when trying to allocate fds.

https://github.com/dragonflyoss/image-service/blob/master/src/bin/nydusd/main.rs#L152

3. Our user daemon will close the anonymous fd once the corresponding
backing file has fully downloaded, to free the fd resources.

4. Even if fd/file allocation fails (in cachefiles_ondemand_get_fd()),
the INIT request will fail, and thus the erofs mount will fail then.
That is, it won't break the upper erofs in this case.

5. If later we find that the number of fds/files is indeed an issue,
then we also plan to make the user daemon close some fds to spare some
free resources. And then the Cachefiles kernel module needs to
reallocate an anonymous fd for the backing file when cache miss. But it
remains to be done later if it's really needed.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

