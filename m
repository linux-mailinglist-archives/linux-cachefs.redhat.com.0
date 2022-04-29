Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC50514983
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Apr 2022 14:36:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-sBGjNwFfPSS3fOdBS53faw-1; Fri, 29 Apr 2022 08:36:34 -0400
X-MC-Unique: sBGjNwFfPSS3fOdBS53faw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46F5B1C068C3;
	Fri, 29 Apr 2022 12:36:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E11943E39A;
	Fri, 29 Apr 2022 12:36:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A64EF1947057;
	Fri, 29 Apr 2022 12:36:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACEC4194704B for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 29 Apr 2022 12:36:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98B03C27EA7; Fri, 29 Apr 2022 12:36:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B28C27EA0
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 12:36:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A7BB3C0FA80
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 12:36:29 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-yGEv7k2OMMCthMRuA1ft-w-1; Fri, 29 Apr 2022 08:36:24 -0400
X-MC-Unique: yGEv7k2OMMCthMRuA1ft-w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0VBi7oKH_1651235776
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VBi7oKH_1651235776) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 29 Apr 2022 20:36:18 +0800
Date: Fri, 29 Apr 2022 20:36:16 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Xin Yin <yinxin.x@bytedance.com>
Message-ID: <YmvbwKSdiCosPhAV@B-P7TQMD6M-0146.local>
Mail-Followup-To: Xin Yin <yinxin.x@bytedance.com>,
 jefflexu@linux.alibaba.com, xiang@kernel.org, dhowells@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, boyu.mt@taobao.com,
 lizefan.x@bytedance.com
References: <20220428233849.321495-1-yinxin.x@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220428233849.321495-1-yinxin.x@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [RFC PATCH 0/1] erofs: change to use
 asynchronous io for fscache readahead
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
Cc: boyu.mt@taobao.com, linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 lizefan.x@bytedance.com, xiang@kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Xin,

On Fri, Apr 29, 2022 at 07:38:48AM +0800, Xin Yin wrote:
> Hi Jeffle & Xiang
> 
> I have tested your fscache,erofs: fscache-based on-demand read semantics 
> v9 patches sets https://www.spinics.net/lists/linux-fsdevel/msg216178.html.
> For now , it works fine with the nydus image-service. After the image data 
> is fully loaded to local storage, it does have great IO performance gain 
> compared with nydus V5 which is based on fuse.

Yeah, thanks for your interest and efforts. Actually I'm pretty sure you
could observe CPU, bandwidth and latency improvement on the dense deployed
scenarios since our goal is to provide native performance when the data is
ready, as well as image on-demand read, flexible cache data management to
end users.

> 
> For 4K random read , fscache-based erofs can get the same performance with 
> the original local filesystem. But I still saw a performance drop in the 4K 
> sequential read case. And I found the root cause is in erofs_fscache_readahead() 
> we use synchronous IO , which may stall the readahead pipelining.
> 

Yeah, that is a known TODO, in principle, when such part of data is locally
available, it will have the similar performance (bandwidth, latency, CPU
loading) as loop device. But we don't implement asynchronous I/O for now,
since we need to make the functionality work first, so thanks for your
patch addressing this.

> I have tried to change to use asynchronous io during erofs fscache readahead 
> procedure, as what netfs did. Then I saw a great performance gain.
> 
> Here are my test steps and results:
> - generate nydus v6 format image , in which stored a large file for IO test.
> - launch nydus image-service , and  make image data fully loaded to local storage (ext4).
> - run fio with below cmd.
> fio -ioengine=psync -bs=4k -size=5G -direct=0 -thread -rw=read -filename=./test_image  -name="test" -numjobs=1 -iodepth=16 -runtime=60

Yeah, although I can see what you mean (to test buffered I/O), the
argument is still somewhat messy (maybe because we don't support
fscache-based direct I/O for now. That is another TODO but with
low priority.)

> 
> v9 patches: 202654 KB/s
> v9 patches + async readahead patch: 407213 KB/s
> ext4: 439912 KB/s

May I ask if such ext4 image is through a loop device? If not, that is
reasonable. Anyway, it's not a big problem for now, we could optimize
it later since it should be exactly the same finally.

And I will drop a message to Jeffle for further review since we're
closing to another 5-day national holiday.

Thanks again!
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

