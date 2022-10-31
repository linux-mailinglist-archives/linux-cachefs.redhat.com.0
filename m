Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E09613EE7
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Oct 2022 21:22:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667247732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vmHfKSUhMlg64vhQA0+Xsc4KPUiqfMmaF8CbGtZpzVc=;
	b=HaX++IejiElTF2Y77NWJ7/BURVPQGA5q1ivzpyJfXXKIJnhTlcDX0IITwS9M22Qaw6ZFYt
	nRC/rIo46jtypsrvAol1k5Nr1+3962aplcGouDUUMxg+E9l9wK6ywrQIdc3oE3nUTZoQmC
	Spz67Kq0kGZncOmVxa4slo9hdgPJwjI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-T5o-xgBNPSKH4PIYbullLw-1; Mon, 31 Oct 2022 16:22:11 -0400
X-MC-Unique: T5o-xgBNPSKH4PIYbullLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2787F383D0C6;
	Mon, 31 Oct 2022 20:21:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36F43111E3E4;
	Mon, 31 Oct 2022 20:21:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 850401946595;
	Mon, 31 Oct 2022 20:21:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 03979194658C for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 20:21:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0BAF40C6FA2; Mon, 31 Oct 2022 20:21:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B703A40C6EC6
 for <linux-cachefs@redhat.com>; Mon, 31 Oct 2022 20:21:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63043383D0C1
 for <linux-cachefs@redhat.com>; Mon, 31 Oct 2022 20:21:35 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-Q5FOoWWuP_mb2CspkMU5gA-1; Mon, 31 Oct 2022 16:21:33 -0400
X-MC-Unique: Q5FOoWWuP_mb2CspkMU5gA-1
Received: by mail-pj1-f70.google.com with SMTP id
 36-20020a17090a0fa700b00213d5296e13so1920552pjz.6
 for <linux-cachefs@redhat.com>; Mon, 31 Oct 2022 13:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vcoVeWng93U8Y1L1n++M4qc03Ih4KJHu2NcI8N531bw=;
 b=Whhlim3bxg6rF8mZv7CpF73GJXyHTTqFTwelw5s0vGd0bUOuH7+ruqGD//qEcMkcYo
 4xF7to6IX0rrU0n3HQ5NSgdDY47KjfkfonyKr4FDFecaCIqWuQVX5C6CDx4ZMIeMzHs0
 +HDORpUA+0/9I9HJAH9SRv5/jLvGo+ql+Hr+yBdfDtEFrIXnINjL9pEOIgnV4MEJv6tc
 gO2NnZ5J8T0CcEsyP9S80CJ2vpFdNlJ1/YDZQaHYf9FJgAE8B9DURTBN69d9ymgthAIn
 HAYAM1+XPlCVhNZNNF2w5W3czdTUcjuzLappRwESBY+4fdr4pBrdX94AlycFVhxGiyE/
 6Gvg==
X-Gm-Message-State: ACrzQf1qRajbAydtRI8+MQYM1UwPyrn+7zuspCgVjS1mvO/YqtcvgTFy
 pUDQkKFPpkx4JMN4cEfnb0O697Y9nR42zkCUbCaUZhVmrkNNj7UUGwlcN8hOf94zf93cNbdu8Vd
 Sod+KxORQKYP8m52mXIGpekpktc1PNcnymywaug==
X-Received: by 2002:a63:8aca:0:b0:461:25fe:e7c5 with SMTP id
 y193-20020a638aca000000b0046125fee7c5mr14263185pgd.395.1667247690892; 
 Mon, 31 Oct 2022 13:21:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7szCfZcHO7yG9qPCPyxqMusBkmQ8j9gSHv2wBtDX3ezvtzaWC7burL4504cUPUo5HJBSnqnye8uPTsiumSvPQ=
X-Received: by 2002:a63:8aca:0:b0:461:25fe:e7c5 with SMTP id
 y193-20020a638aca000000b0046125fee7c5mr14263160pgd.395.1667247690301; Mon, 31
 Oct 2022 13:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220923201439.1974099-1-dwysocha@redhat.com>
In-Reply-To: <20220923201439.1974099-1-dwysocha@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 31 Oct 2022 16:20:53 -0400
Message-ID: <CALF+zOm1nb6PkRkPG3d2oa18AaT+ru6U4+5V9HfuZVBmf738NA@mail.gmail.com>
To: Daire Byrne <daire.byrne@gmail.com>, David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [PATCH 0/1] Debug oops in
 cachefiles_prepare_write with NFS netfs conversion on reexport server
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 23, 2022 at 4:14 PM Dave Wysochanski <dwysocha@redhat.com>
wrote:
>
> Daire this debug patch is for your setup when you have time to test it.
> Also I am not sure if David Howells has a theory as to what is happening
> just from the oops and description below.  I will also keep looking a
> bit more at what might be happening.
>
> This patch should help debug the oops seen by Daire's re-export
> server while running tests on some of my NFS fscache netfs conversion
> patches.  This is only the first patch but should give at least
> the next clues as to what is happening.
>
> Add this patch on top of my v8 series just posted on Sep 22:
> https://marc.info/?l=linux-nfs&m=166385481714542&w=4
>
> Once built and booted, you should enable ftrace events for netfs,
> cachefiles, and fscache.  To start with, use the following comprehensive
> trace events.  Note I'm not using trace-cmd because I think you
> mentioned this may not work due to the older userspace on your
> machine.  If you use the /proc files you can also control the events:
>  echo 1 > /sys/kernel/debug/tracing/events/cachefiles/enable
>  echo 1 > /sys/kernel/debug/tracing/events/fscache/enable
>  echo 1 > /sys/kernel/debug/tracing/events/netfs/enable
>  echo 1 > /sys/kernel/debug/tracing/tracing_on
>
> The above should be the equivalent of:
> trace-cmd start -e netfs:* -e fscache:* -e cachefiles:*
>
> You may need to increase buffer_size_kb:
>  cat /sys/kernel/debug/tracing/buffer_size_kb
> 1024
>  echo 16384 > /sys/kernel/debug/tracing/buffer_size_kb
>  cat /sys/kernel/debug/tracing/buffer_size_kb
> 16384
>
> Then make sure the following is set:
>  sysctl kernel.ftrace_dump_on_oops=1
>  sysctl kernel.panic_on_oops=1
>
> Then reproduce the problem.  My current theory is detailed below, and if
> it's on the mark, I'd expect to see the ftrace event buffer contain a
> line like this:
>
> [   99.078288] kworker/-140       5..... 27889469us :
cachefiles_prepare_write: object == NULL: c=00000004
>
> Then we can take the cookie value and hopefully discern the history of
> the crash.  From the oops, below is my current theory of what is
> happening.
>


Daire has reproduced the problem with this debug patch and is hitting
the above BUG which matches the previous theory of what is happening and
gets us a bit further along.

Per his ftrace we see the suspected BUG:
[29720.158119] kworker/-23613     3..... 9424722090us :
cachefiles_prepare_write: object == NULL: c=00000b95

Back up from there to see if we can determine what happened:
$ grep -B 4000 "object == NULL:" loncloudnfscache5-serial.log | egrep
'(c=00000b95|R=00278174)'
[29690.046137] kworker/-19194     1..... 9424710955us : fscache_cookie:
c=00000b95 -   lrudo r=3
[29690.082232] kworker/-19194     1..... 9424710955us : fscache_access:
c=00000b95 UNPIN cache   r=3 a=0
[29690.091621] kworker/-19194     1..... 9424710955us : fscache_cookie:
c=00000b95 GQ  endac r=4
[29690.261035] kworker/-19194     1..... 9424710957us : fscache_cookie:
c=00000b95 PUT lru   r=3
[29690.607434]     nfsd-2004      5...1. 9424710960us : fscache_active:
c=00000b95 USE           r=3 a=0 c=1
[29692.215455]     nfsd-2004      5..... 9424710975us : fscache_access:
c=00000b95 BEGIN io_read r=3 a=1
[29692.405546] kworker/-25371     0..... 9424710975us : fscache_cookie:
c=00000b95 -   work  r=3
[29692.421426]     nfsd-2004      5..... 9424710976us : netfs_read:
R=00278174 READAHEAD c=00000b95 ni=8bb0005 s=0 10000
[29692.488038] kworker/-25371     0..... 9424710976us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 SEE withdraw_cookie
[29692.520323] kworker/-25371     0...1. 9424710976us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 SEE withdrawal
[29692.656826] kworker/-25371     0..... 9424710977us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 SEE clean_commit
[29692.683613]     nfsd-2004      5..... 9424710977us : netfs_rreq_ref:
R=00278174 GET SUBREQ  r=2
[29692.750300]     nfsd-2004      5..... 9424710977us :
cachefiles_prep_read: R=00278174[0] DOWN no-data    f=01 s=0 10000
ni=8bb0005 B=5a601b9
[29692.837249]     nfsd-2004      5..... 9424710977us : netfs_sreq:
R=00278174[0] DOWN PREP  f=01 s=0 0/10000 e=0
[29692.916087]     nfsd-2004      5..... 9424710978us : netfs_sreq:
R=00278174[0] DOWN SUBMT f=01 s=0 0/10000 e=0
[29693.315546] kworker/-25371     0..... 9424710983us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 PUT detach
[29693.381768] kworker/-25371     0..... 9424710983us : fscache_cookie:
c=00000b95 PUT obj   r=2
[29693.427768] kworker/-25371     0...1. 9424710983us : fscache_cookie:
c=00000b95 -   x-lru r=2
[29693.446174] kworker/-25371     0..... 9424710984us : fscache_cookie:
c=00000b95 PQ  work  r=1
[29720.026557] kworker/-23613     3..... 9424722078us : netfs_sreq:
R=00278174[0] DOWN TERM  f=01 s=0 10000/10000 e=0
[29720.037562] kworker/-23613     3..... 9424722078us : netfs_rreq:
R=00278174 RA ASSESS  f=22
[29720.061359] kworker/-23613     3..... 9424722079us : netfs_rreq:
R=00278174 RA UNLOCK  f=22
[29720.132747] kworker/-23613     3..... 9424722087us : netfs_sreq_ref:
R=00278174[0] PUT TERM    r=1
[29720.145155] kworker/-23613     3..... 9424722088us : netfs_rreq:
R=00278174 RA COPY    f=02
[29720.158119] kworker/-23613     3..... 9424722090us :
cachefiles_prepare_write: object == NULL: c=00000b95



So nfsd-2004 initiated a read and data was not in the cache, so we had
to get it from NFS:
[29692.683613]     nfsd-2004      5..... 9424710977us : netfs_rreq_ref:
R=00278174 GET SUBREQ  r=2
[29692.750300]     nfsd-2004      5..... 9424710977us :
cachefiles_prep_read: R=00278174[0] DOWN no-data    f=01 s=0 10000
ni=8bb0005 B=5a601b9
[29692.837249]     nfsd-2004      5..... 9424710977us : netfs_sreq:
R=00278174[0] DOWN PREP  f=01 s=0 0/10000 e=0
[29692.916087]     nfsd-2004      5..... 9424710978us : netfs_sreq:
R=00278174[0] DOWN SUBMT f=01 s=0 0/10000 e=0
....
When the read completes successfully, we see the UNLOCK and attempt to
copy to the cache but we get the "object == NULL"
[29720.026557] kworker/-23613     3..... 9424722078us : netfs_sreq:
R=00278174[0] DOWN TERM  f=01 s=0 10000/10000 e=0
[29720.037562] kworker/-23613     3..... 9424722078us : netfs_rreq:
R=00278174 RA ASSESS  f=22
[29720.061359] kworker/-23613     3..... 9424722079us : netfs_rreq:
R=00278174 RA UNLOCK  f=22
[29720.132747] kworker/-23613     3..... 9424722087us : netfs_sreq_ref:
R=00278174[0] PUT TERM    r=1
[29720.145155] kworker/-23613     3..... 9424722088us : netfs_rreq:
R=00278174 RA COPY    f=02
[29720.158119] kworker/-23613     3..... 9424722090us :
cachefiles_prepare_write: object == NULL: c=00000b95
But how did we get the "object == NULL"?
The previous oops analysis indicated that likely the only way this
would happen is if cachefiles_withdraw_cookie()
were called.  Sure enough, we do see this in the trace prior to
nfsd-2004 initiating the read:
[29690.607434]     nfsd-2004      5...1. 9424710960us : fscache_active:
c=00000b95 USE           r=3 a=0 c=1
[29692.215455]     nfsd-2004      5..... 9424710975us : fscache_access:
c=00000b95 BEGIN io_read r=3 a=1
[29692.405546] kworker/-25371     0..... 9424710975us : fscache_cookie:
c=00000b95 -   work  r=3
[29692.421426]     nfsd-2004      5..... 9424710976us : netfs_read:
R=00278174 READAHEAD c=00000b95 ni=8bb0005 s=0 10000
[29692.488038] kworker/-25371     0..... 9424710976us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 SEE withdraw_cookie
[29692.520323] kworker/-25371     0...1. 9424710976us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 SEE withdrawal
[29692.656826] kworker/-25371     0..... 9424710977us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 SEE clean_commit
[29692.750300]     nfsd-2004      5..... 9424710977us :
cachefiles_prep_read: R=00278174[0] DOWN no-data    f=01 s=0 10000
ni=8bb0005 B=5a601b9
[29692.837249]     nfsd-2004      5..... 9424710977us : netfs_sreq:
R=00278174[0] DOWN PREP  f=01 s=0 0/10000 e=0
[29692.916087]     nfsd-2004      5..... 9424710978us : netfs_sreq:
R=00278174[0] DOWN SUBMT f=01 s=0 0/10000 e=0

This looks like a race between kworker/-25371 and nfsd-2004.

NOTE: cachefiles_withdraw_cookie ==
cookie->volume->cache->ops->withdraw_cookie
below.

The cookie had to have gone through the following part of the state machine:
fs/fscache/cookie.c
686 /*
 687  * Perform work upon the cookie, such as committing its cache state,
 688  * relinquishing it or withdrawing the backing cache.  We're protected
from the
 689  * cache going away under us as object withdrawal must come through
this
 690  * non-reentrant work item.
 691  */
 692 static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 693 {
 694         enum fscache_cookie_state state;
 695         bool wake = false;
 696
 697         _enter("c=%x", cookie->debug_id);
 698
 699 again:
 700         spin_lock(&cookie->lock);
 701 again_locked:
 702         state = cookie->state;
 703         switch (state) {
...
763         case FSCACHE_COOKIE_STATE_LRU_DISCARDING:
 764         case FSCACHE_COOKIE_STATE_RELINQUISHING:
 765         case FSCACHE_COOKIE_STATE_WITHDRAWING:
 766                 if (cookie->cache_priv) {
 767                         spin_unlock(&cookie->lock);
 768
cookie->volume->cache->ops->withdraw_cookie(cookie);
 769                         spin_lock(&cookie->lock);
 770                 }
 771
 772                 if (test_and_clear_bit(FSCACHE_COOKIE_DO_INVALIDATE,
&cookie->flags))
 773                         fscache_end_cookie_access(cookie,
fscache_access_invalidate_cookie_end);
 774
 775                 switch (state) {
 776                 case FSCACHE_COOKIE_STATE_RELINQUISHING:
 777                         fscache_see_cookie(cookie,
fscache_cookie_see_relinquish);
 778                         fscache_unhash_cookie(cookie);
 779                         __fscache_set_cookie_state(cookie,
 780
 FSCACHE_COOKIE_STATE_DROPPED);
 781                         wake = true;
 782                         goto out;
 783                 case FSCACHE_COOKIE_STATE_LRU_DISCARDING:
 784                         fscache_see_cookie(cookie,
fscache_cookie_see_lru_discard);
 785                         break;
 786                 case FSCACHE_COOKIE_STATE_WITHDRAWING:
 787                         fscache_see_cookie(cookie,
fscache_cookie_see_withdraw);
 788                         break;
 789                 default:
 790                         BUG();
 791                 }
 792
 793                 clear_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &cookie->flags);
 794                 clear_bit(FSCACHE_COOKIE_DO_WITHDRAW, &cookie->flags);
 795                 clear_bit(FSCACHE_COOKIE_DO_LRU_DISCARD,
&cookie->flags);
 796                 clear_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE,
&cookie->flags);
 797                 set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ,
&cookie->flags);
 798                 __fscache_set_cookie_state(cookie,
FSCACHE_COOKIE_STATE_QUIESCENT);
 799                 wake = true;
 800                 goto again_locked;
 801
 802         case FSCACHE_COOKIE_STATE_DROPPED:
 803                 break;
 804
 805         default:
 806                 WARN_ONCE(1, "Cookie %x in unexpected state %u\n",
 807                           cookie->debug_id, state);
 808                 break;
 809         }


There's only 3 possibilities for the cache->state if we've called
withdraw_cookie, but we see this in the ftrace log,
which tells us which one it is:
[29693.315546] kworker/-25371     0..... 9424710983us : cachefiles_ref:
c=00000b95 o=0009b320 u=1 PUT detach
[29693.381768] kworker/-25371     0..... 9424710983us : fscache_cookie:
c=00000b95 PUT obj   r=2
[29693.427768] kworker/-25371     0...1. 9424710983us : fscache_cookie:
c=00000b95 -   x-lru r=2
[29693.446174] kworker/-25371     0..... 9424710984us : fscache_cookie:
c=00000b95 PQ  work  r=1
The "x-lru" only happens if state == FSCACHE_COOKIE_STATE_LRU_DISCARDING.

From the state machine, the only place that happens is if the cookie
is active and someone sets the bit:
729         case FSCACHE_COOKIE_STATE_ACTIVE:
 730                 if
(test_and_clear_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE, &cookie->flags)) {
 731                         spin_unlock(&cookie->lock);
 732                         fscache_prepare_to_write(cookie);
 733                         spin_lock(&cookie->lock);
 734                 }
 735                 if (test_bit(FSCACHE_COOKIE_DO_LRU_DISCARD,
&cookie->flags)) {
 736                         __fscache_set_cookie_state(cookie,
 737
 FSCACHE_COOKIE_STATE_LRU_DISCARDING);
 738                         wake = true;
 739                         goto again_locked;
 740                 }
 741                 fallthrough;
The only place that happens is here:
848 static void fscache_cookie_lru_do_one(struct fscache_cookie *cookie)
 849 {
 850         fscache_see_cookie(cookie, fscache_cookie_see_lru_do_one);
 851
 852         spin_lock(&cookie->lock);
 853         if (cookie->state != FSCACHE_COOKIE_STATE_ACTIVE ||
 854             time_before(jiffies, cookie->unused_at +
fscache_lru_cookie_timeout) ||
 855             atomic_read(&cookie->n_active) > 0) {
 856                 spin_unlock(&cookie->lock);
 857                 fscache_stat(&fscache_n_cookies_lru_removed);
 858         } else {
 859                 set_bit(FSCACHE_COOKIE_DO_LRU_DISCARD, &cookie->flags);
 860                 spin_unlock(&cookie->lock);
 861                 fscache_stat(&fscache_n_cookies_lru_expired);
 862                 _debug("lru c=%x", cookie->debug_id);
 863                 __fscache_withdraw_cookie(cookie);
 864         }
 865
 866         fscache_put_cookie(cookie, fscache_cookie_put_lru);
 867 }

The above gets called from:
869 static void fscache_cookie_lru_worker(struct work_struct *work)
 870 {
 871         struct fscache_cookie *cookie;
 872         unsigned long unused_at;
 873
 874         spin_lock(&fscache_cookie_lru_lock);
 875
 876         while (!list_empty(&fscache_cookie_lru)) {
 877                 cookie = list_first_entry(&fscache_cookie_lru,
 878                                           struct fscache_cookie,
commit_link);
 879                 unused_at = cookie->unused_at +
fscache_lru_cookie_timeout;
 880                 if (time_before(jiffies, unused_at)) {
 881                         timer_reduce(&fscache_cookie_lru_timer,
unused_at);
 882                         break;
 883                 }
 884
 885                 list_del_init(&cookie->commit_link);
 886                 fscache_stat_d(&fscache_n_cookies_lru);
 887                 spin_unlock(&fscache_cookie_lru_lock);
 888                 fscache_cookie_lru_do_one(cookie);
 889                 spin_lock(&fscache_cookie_lru_lock);
 890         }
 891
 892         spin_unlock(&fscache_cookie_lru_lock);
 893 }
 894
 895 static void fscache_cookie_lru_timed_out(struct timer_list *timer)
 896 {
 897         queue_work(fscache_wq, &fscache_cookie_lru_work);
 898 }

Somehow it looks like the cookie gets freed via the LRU while another
process
is in the process of using it.  Is there some race between use and unuse of
cookies that NFS exposes?  Need to take a close look at the
fscache_use_cookie()
and fscache_unuse_cookie() as there seems to be some race possible.


565 /*
 566  * Start using the cookie for I/O.  This prevents the backing object
from being
 567  * reaped by VM pressure.
 568  */
 569 void __fscache_use_cookie(struct fscache_cookie *cookie, bool
will_modify)
 570 {
 571         enum fscache_cookie_state state;
 572         bool queue = false;
 573         int n_active;
 574
 575         _enter("c=%08x", cookie->debug_id);
 576
 577         if (WARN(test_bit(FSCACHE_COOKIE_RELINQUISHED, &cookie->flags),
 578                  "Trying to use relinquished cookie\n"))
 579                 return;
 580
 581         spin_lock(&cookie->lock);
 582
 583         n_active = atomic_inc_return(&cookie->n_active);
 584         trace_fscache_active(cookie->debug_id,
refcount_read(&cookie->ref),
 585                              n_active,
atomic_read(&cookie->n_accesses),
 586                              will_modify ?
 587                              fscache_active_use_modify :
fscache_active_use);
 588
 589 again:
 590         state = fscache_cookie_state(cookie);
 591         switch (state) {
 592         case FSCACHE_COOKIE_STATE_QUIESCENT:
 593                 queue = fscache_begin_lookup(cookie, will_modify);
 594                 break;
 595
 596         case FSCACHE_COOKIE_STATE_LOOKING_UP:
 597         case FSCACHE_COOKIE_STATE_CREATING:
 598                 if (will_modify)
 599                         set_bit(FSCACHE_COOKIE_LOCAL_WRITE,
&cookie->flags);
 600                 break;
 601         case FSCACHE_COOKIE_STATE_ACTIVE:
 602         case FSCACHE_COOKIE_STATE_INVALIDATING:
 603                 if (will_modify &&
 604                     !test_and_set_bit(FSCACHE_COOKIE_LOCAL_WRITE,
&cookie->flags)) {
 605                         set_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE,
&cookie->flags);
 606                         queue = true;
 607                 }
 608                 break;
 609
 610         case FSCACHE_COOKIE_STATE_FAILED:
 611         case FSCACHE_COOKIE_STATE_WITHDRAWING:
 612                 break;
 613
 614         case FSCACHE_COOKIE_STATE_LRU_DISCARDING:
 615                 spin_unlock(&cookie->lock);
 616                 wait_var_event(&cookie->state,
 617                                fscache_cookie_state(cookie) !=
 618                                FSCACHE_COOKIE_STATE_LRU_DISCARDING);
 619                 spin_lock(&cookie->lock);
 620                 goto again;
 621
 622         case FSCACHE_COOKIE_STATE_DROPPED:
 623         case FSCACHE_COOKIE_STATE_RELINQUISHING:
 624                 WARN(1, "Can't use cookie in state %u\n", state);
 625                 break;
 626         }
 627
 628         spin_unlock(&cookie->lock);
 629         if (queue)
 630                 fscache_queue_cookie(cookie,
fscache_cookie_get_use_work);
 631         _leave("");
 632 }
 633 EXPORT_SYMBOL(__fscache_use_cookie);
 634
 635 static void fscache_unuse_cookie_locked(struct fscache_cookie *cookie)
 636 {
 637         clear_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags);
 638         if (!test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags))
 639                 return;
 640
 641         cookie->unused_at = jiffies;
 642         spin_lock(&fscache_cookie_lru_lock);
 643         if (list_empty(&cookie->commit_link)) {
 644                 fscache_get_cookie(cookie, fscache_cookie_get_lru);
 645                 fscache_stat(&fscache_n_cookies_lru);
 646         }
 647         list_move_tail(&cookie->commit_link, &fscache_cookie_lru);
 648
 649         spin_unlock(&fscache_cookie_lru_lock);
 650         timer_reduce(&fscache_cookie_lru_timer,
 651                      jiffies + fscache_lru_cookie_timeout);
 652 }
 653
 654 /*
 655  * Stop using the cookie for I/O.
 656  */
 657 void __fscache_unuse_cookie(struct fscache_cookie *cookie,
 658                             const void *aux_data, const loff_t
*object_size)
 659 {
 660         unsigned int debug_id = cookie->debug_id;
 661         unsigned int r = refcount_read(&cookie->ref);
 662         unsigned int a = atomic_read(&cookie->n_accesses);
 663         unsigned int c;
 664
 665         if (aux_data || object_size)
 666                 __fscache_update_cookie(cookie, aux_data, object_size);
 667
 668         /* Subtract 1 from counter unless that drops it to 0 (ie. it
was 1) */
 669         c = atomic_fetch_add_unless(&cookie->n_active, -1, 1);
 670         if (c != 1) {
 671                 trace_fscache_active(debug_id, r, c - 1, a,
fscache_active_unuse);
 672                 return;
 673         }
 674
 675         spin_lock(&cookie->lock);
 676         r = refcount_read(&cookie->ref);
 677         a = atomic_read(&cookie->n_accesses);
 678         c = atomic_dec_return(&cookie->n_active);
 679         trace_fscache_active(debug_id, r, c, a, fscache_active_unuse);
 680         if (c == 0)
 681                 fscache_unuse_cookie_locked(cookie);
 682         spin_unlock(&cookie->lock);
 683 }
 684 EXPORT_SYMBOL(__fscache_unuse_cookie);



On Fri, Sep 23, 2022 at 4:14 PM Dave Wysochanski <dwysocha@redhat.com>
wrote:

> Daire this debug patch is for your setup when you have time to test it.
> Also I am not sure if David Howells has a theory as to what is happening
> just from the oops and description below.  I will also keep looking a
> bit more at what might be happening.
>
> This patch should help debug the oops seen by Daire's re-export
> server while running tests on some of my NFS fscache netfs conversion
> patches.  This is only the first patch but should give at least
> the next clues as to what is happening.
>
> Add this patch on top of my v8 series just posted on Sep 22:
> https://marc.info/?l=linux-nfs&m=166385481714542&w=4
>
> Once built and booted, you should enable ftrace events for netfs,
> cachefiles, and fscache.  To start with, use the following comprehensive
> trace events.  Note I'm not using trace-cmd because I think you
> mentioned this may not work due to the older userspace on your
> machine.  If you use the /proc files you can also control the events:
>  echo 1 > /sys/kernel/debug/tracing/events/cachefiles/enable
>  echo 1 > /sys/kernel/debug/tracing/events/fscache/enable
>  echo 1 > /sys/kernel/debug/tracing/events/netfs/enable
>  echo 1 > /sys/kernel/debug/tracing/tracing_on
>
> The above should be the equivalent of:
> trace-cmd start -e netfs:* -e fscache:* -e cachefiles:*
>
> You may need to increase buffer_size_kb:
>  cat /sys/kernel/debug/tracing/buffer_size_kb
> 1024
>  echo 16384 > /sys/kernel/debug/tracing/buffer_size_kb
>  cat /sys/kernel/debug/tracing/buffer_size_kb
> 16384
>
> Then make sure the following is set:
>  sysctl kernel.ftrace_dump_on_oops=1
>  sysctl kernel.panic_on_oops=1
>
> Then reproduce the problem.  My current theory is detailed below, and if
> it's on the mark, I'd expect to see the ftrace event buffer contain a
> line like this:
>
> [   99.078288] kworker/-140       5..... 27889469us :
> cachefiles_prepare_write: object == NULL: c=00000004
>
> Then we can take the cookie value and hopefully discern the history of
> the crash.  From the oops, below is my current theory of what is
> happening.
>
>
> Summary of oops
> ===============
> Theory from oops decode and struct offsets (crash-utility) is that somehow
> the cachefiles_object * is going to NULL while a write is going in
> progress.
>
> If that is true, then look at how a cachefiles_object * value stored inside
> fscache_cookie.cache_priv could be NULL.  There appears to be only one
> possibility, and that is cachefiles_withdraw_cookie() was called despite
> the fact that we are trying to write to the object.
>
>
>
> Details on how cachefiles_object * could be NULL
> ================================================
> [dwysocha@dwysocha kernel]$ grep -n "cache_priv =" fs/cachefiles/*.[ch]
> fs/cachefiles/interface.c:188:  cookie->cache_priv = object;
> fs/cachefiles/interface.c:373:  cookie->cache_priv = NULL;
> fs/cachefiles/volume.c:80:      vcookie->cache_priv = volume;
> fs/cachefiles/volume.c:114:     volume->vcookie->cache_priv = NULL;
> [dwysocha@dwysocha kernel]$
>
>
> 346 /*
> 347  * Withdraw caching for a cookie.
> 348  */
> 349 static void cachefiles_withdraw_cookie(struct fscache_cookie *cookie)
> 350 {
> 351         struct cachefiles_object *object = cookie->cache_priv;
> 352         struct cachefiles_cache *cache = object->volume->cache;
> 353         const struct cred *saved_cred;
> 354
> 355         _enter("o=%x", object->debug_id);
> 356         cachefiles_see_object(object,
> cachefiles_obj_see_withdraw_cookie);
> 357
> 358         if (!list_empty(&object->cache_link)) {
> 359                 spin_lock(&cache->object_list_lock);
> 360                 cachefiles_see_object(object,
> cachefiles_obj_see_withdrawal);
> 361                 list_del_init(&object->cache_link);
> 362                 spin_unlock(&cache->object_list_lock);
> 363         }
> 364
> 365         cachefiles_ondemand_clean_object(object);
> 366
> 367         if (object->file) {
> 368                 cachefiles_begin_secure(cache, &saved_cred);
> 369                 cachefiles_clean_up_object(object, cache);
> 370                 cachefiles_end_secure(cache, saved_cred);
> 371         }
> 372
> 373         cookie->cache_priv = NULL;
> 374         cachefiles_put_object(object, cachefiles_obj_put_detach);
> 375 }
>
> Since this is not a volume, the above is the only possibility for how
> cookie->cache_prive == NULL, aside from memory corruption, which
> seems unlikely given the predictable nature of the crashes.
>
>
>
> Details on how we conclude cachefiles_object * == NULL
> ======================================================
>
> First, netfs_cache_resources * cannot be null because the caller
> netfs_rreq_do_write_to_cache() does the below to set 'cres' before
> passing 'cres' to cachefiles_prepare_write:
>         struct netfs_cache_resources *cres = &rreq->cache_resources;
>
> crash> struct -o netfs_cache_resources.cache_priv
> struct netfs_cache_resources {
>    [8] void *cache_priv;
> }
>
> It's possible that 'netfs_cache_resources.cache_priv' value is NULL.
> But that would not explain the offset of 32 into the structure
> for the next dereference - this is not where we panic (we panic
> on a address of 0000000000000008, not 0000000000000032)
>
> crash> struct -o fscache_cookie.cache_priv
> struct fscache_cookie {
>    [32] void *cache_priv;
> }
>
> So clearly the above is not NULL.  However, the value of
> fscache_cookie.cache_priv
> is possible to be NULL since the offset of 'volume' member is 8.  So if the
> cachefiles_object * which is stored inside fscache_cookie.cache_priv ==
> NULL,
> this would explain the crash.
>
> crash> struct -o cachefiles_object.volume
> struct cachefiles_object {
>    [8] struct cachefiles_volume *volume;
> }
> crash>
>
>
>
>
> From Daire
>
> 58710.346376] BUG: kernel NULL pointer dereference, address:
> 0000000000000008
> [58710.353508] #PF: supervisor read access in kernel mode
> [58710.358775] #PF: error_code(0x0000) - not-present page
> [58710.364041] PGD 0 P4D 0
> [58710.366721] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G E
> 6.0.0-2.dneg.x86_64 #1
> [58710.380647] Hardware name: Google Google Compute Engine/Google
> Compute Engine, BIOS Google 07/22/2022
> [58710.389995] Workqueue: events_unbound netfs_rreq_write_to_cache_work
> [netfs]
> [58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
>
>
>
> #./scripts/faddr2line --list fs/cachefiles/cachefiles.ko
> cachefiles_prepare_write+0x2
> cachefiles_prepare_write+0x28/0x90:
>
> cachefiles_prepare_write at
>
> /user_data/rpmbuild/BUILD/kernel-ml-6.0.0/linux-6.0.0-2.dneg.x86_64/fs/cachefiles/io.c:587
>  582 static int cachefiles_prepare_write(struct netfs_cache_resources
> *cres,
>  583     loff_t *_start, size_t *_len, loff_t i_size,
>  584     bool no_space_allocated_yet)
>  585 {
>  586 struct cachefiles_object *object = cachefiles_cres_object(cres);
> >587< struct cachefiles_cache *cache = object->volume->cache;
>  588 const struct cred *saved_cred;
>  589 int ret;
>  590
>  591 if (!cachefiles_cres_file(cres)) {
>  592 if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
>
> #./scripts/faddr2line --list fs/netfs/netfs.ko
> netfs_rreq_write_to_cache_work+0x11c
> netfs_rreq_write_to_cache_work+0x11c/0x320:
>
> netfs_rreq_do_write_to_cache at
>
> /user_data/rpmbuild/BUILD/kernel-ml-6.0.0/linux-6.0.0-2.dneg.x86_64/fs/netfs/io.c:200
>  195 list_del_init(&next->rreq_link);
>  196 netfs_put_subrequest(next, false,
>  197      netfs_sreq_trace_put_merged);
>  198 }
>  199
> >200< ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
>  201        rreq->i_size, true);
>  202 if (ret < 0) {
>  203 trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
>  204 trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
>  205 continue;
>
> (inlined by) netfs_rreq_write_to_cache_work at
>
> /user_data/rpmbuild/BUILD/kernel-ml-6.0.0/linux-6.0.0-2.dneg.x86_64/fs/netfs/io.c:229
>  224 static void netfs_rreq_write_to_cache_work(struct work_struct *work)
>  225 {
>  226 struct netfs_io_request *rreq =
>  227 container_of(work, struct netfs_io_request, work);
>  228
> >229< netfs_rreq_do_write_to_cache(rreq);
>  230 }
>  231
>  232 static void netfs_rreq_write_to_cache(struct netfs_io_request *rreq)
>  233 {
>  234 rreq->work.func = netfs_rreq_write_to_cache_work;
>
>
>
>
> 162 /*
> 163  * Perform any outstanding writes to the cache.  We inherit a ref from
> the
> 164  * caller.
> 165  */
> 166 static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
> 167 {
> 168         struct netfs_cache_resources *cres = &rreq->cache_resources;
> <--- THIS CANNOT BE NULL ????
> 169         struct netfs_io_subrequest *subreq, *next, *p;
> 170         struct iov_iter iter;
> 171         int ret;
> 172
> 173         trace_netfs_rreq(rreq, netfs_rreq_trace_copy);
> 174
> 175         /* We don't want terminating writes trying to wake us up
> whilst we're
> 176          * still going through the list.
> 177          */
> 178         atomic_inc(&rreq->nr_copy_ops);
> 179
> 180         list_for_each_entry_safe(subreq, p, &rreq->subrequests,
> rreq_link) {
> 181                 if (!test_bit(NETFS_SREQ_COPY_TO_CACHE,
> &subreq->flags)) {
> 182                         list_del_init(&subreq->rreq_link);
> 183                         netfs_put_subrequest(subreq, false,
> 184
> netfs_sreq_trace_put_no_copy);
> 185                 }
> 186         }
> 187
> 188         list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
> 189                 /* Amalgamate adjacent writes */
> 190                 while (!list_is_last(&subreq->rreq_link,
> &rreq->subrequests)) {
> 191                         next = list_next_entry(subreq, rreq_link);
> 192                         if (next->start != subreq->start + subreq->len)
> 193                                 break;
> 194                         subreq->len += next->len;
> 195                         list_del_init(&next->rreq_link);
> 196                         netfs_put_subrequest(next, false,
> 197
> netfs_sreq_trace_put_merged);
> 198                 }
> 199
> 200                 ret = cres->ops->prepare_write(cres, &subreq->start,
> &subreq->len,  <--- PRESUMABLY WE ARE HERE ???
> 201                                                rreq->i_size, true);
>
>
>
>
>
>
>
> [58710.346376] BUG: kernel NULL pointer dereference, address:
> 0000000000000008
> [58710.353508] #PF: supervisor read access in kernel mode
> [58710.358775] #PF: error_code(0x0000) - not-present page
> [58710.364041] PGD 0 P4D 0
> [58710.366721] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G
>      E      6.0.0-2.dneg.x86_64 #1
> [58710.380647] Hardware name: Google Google Compute Engine/Google
> Compute Engine, BIOS Google 07/22/2022
> [58710.389995] Workqueue: events_unbound netfs_rreq_write_to_cache_work
> [netfs]
> [58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
> [58710.403767] Code: 00 00 0f 1f 44 00 00 41 57 49 89 d7 41 56 41 55
> 41 54 49 89 f4 55 44 89 c5 53 48 8b 47 08 48 89 fb 48 83 7f 10 00 4c
> 8b 70 20 <49> 8b 46 08 4c 8b 28 74 3f 49 8b 7d 50 e8 66 c6 0b cd 48 8b
> 73 10
> [58710.422676] RSP: 0018:ffffb6e12728bde8 EFLAGS: 00010286
> [58710.428031] RAX: ffff93649754b970 RBX: ffff9335925e38f0 RCX:
> 00000000030cb5e8
> [58710.435303] RDX: ffff9335123653e0 RSI: ffff9335123653d8 RDI:
> ffff9335925e38f0
> [58710.442567] RBP: 0000000000000001 R08: 0000000000000001 R09:
> 8080808080808080
> [58710.449833] R10: ffff9335900444f4 R11: 000000000000000f R12:
> ffff9335123653d8
> [58710.457109] R13: ffff9335925e38f0 R14: 0000000000000000 R15:
> ffff9335123653e0
> [58710.464374] FS:  0000000000000000(0000) GS:ffff93733f900000(0000)
> knlGS:0000000000000000
> [58710.472593] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [58710.478480] CR2: 0000000000000008 CR3: 0000004055e56003 CR4:
> 00000000003706e0
> [58710.485767] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [58710.493037] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [58710.500316] Call Trace:
> [58710.502894]  <TASK>
> [58710.505126]  netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
> [58710.511201]  process_one_work+0x217/0x3e0
> [58710.515358]  worker_thread+0x4a/0x3b0
> [58710.519152]  ? process_one_work+0x3e0/0x3e0
> [58710.523467]  kthread+0xd6/0x100
> [58710.526740]  ? kthread_complete_and_exit+0x20/0x20
> [58710.531659]  ret_from_fork+0x1f/0x30
> [58710.535370]  </TASK>
> [58710.537702] Modules linked in: rpcsec_gss_krb5(E) tcp_diag(E)
> inet_diag(E) nfsv3(E) nfs(E) cachefiles(E) fscache(E) netfs(E) ext4(E)
> mbcache(E) jbd2(E) intel_rapl_msr(E) intel_rapl_common(E) sg(E)
> nfit(E) libnvdimm(E) i2c_piix4(E) rapl(E) nfsd(E) auth_rpcgss(E)
> sch_fq(E) nfs_acl(E) lockd(E) tcp_bbr(E) grace(E) binfmt_misc(E)
> ip_tables(E) xfs(E) libcrc32c(E) sd_mod(E) t10_pi(E)
> crc64_rocksoft_generic(E) crc64_rocksoft(E) crc64(E) 8021q(E) garp(E)
> mrp(E) stp(E) crct10dif_pclmul(E) llc(E) crc32_pclmul(E)
> crc32c_intel(E) scsi_transport_iscsi(E) ghash_clmulni_intel(E)
> serio_raw(E) virtio_scsi(E) gve(E) sunrpc(E) dm_mirror(E)
> dm_region_hash(E) dm_log(E) dm_mod(E) fuse(E)
> [58710.596756] CR2: 0000000000000008
> [58710.600204] ---[ end trace 0000000000000000 ]---
> [58710.604952] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
> [58710.611534] Code: 00 00 0f 1f 44 00 00 41 57 49 89 d7 41 56 41 55
> 41 54 49 89 f4 55 44 89 c5 53 48 8b 47 08 48 89 fb 48 83 7f 10 00 4c
> 8b 70 20 <49> 8b 46 08 4c 8b 28 74 3f 49 8b 7d 50 e8 66 c6 0b cd 48 8b
> 73 10
> [58710.630429] RSP: 0018:ffffb6e12728bde8 EFLAGS: 00010286
> [58710.635799] RAX: ffff93649754b970 RBX: ffff9335925e38f0 RCX:
> 00000000030cb5e8
> [58710.643077] RDX: ffff9335123653e0 RSI: ffff9335123653d8 RDI:
> ffff9335925e38f0
> [58710.650342] RBP: 0000000000000001 R08: 0000000000000001 R09:
> 8080808080808080
> [58710.657607] R10: ffff9335900444f4 R11: 000000000000000f R12:
> ffff9335123653d8
> [58710.664872] R13: ffff9335925e38f0 R14: 0000000000000000 R15:
> ffff9335123653e0
> [58710.672142] FS:  0000000000000000(0000) GS:ffff93733f900000(0000)
> knlGS:0000000000000000
> [58710.680362] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [58710.686238] CR2: 0000000000000008 CR3: 0000004055e56003 CR4:
> 00000000003706e0
> [58710.693503] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [58710.700767] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [58710.708031] Kernel panic - not syncing: Fatal exception
> [58710.714064] Kernel Offset: 0xc600000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> [58710.724898] ---[ end Kernel panic - not syncing: Fatal exception ]---
>
> I think I reported this one (or similar before) but to be honest, I
> have lost track of whether I have only seen it in your branches or I
> have seen it in the vanilla kernel too?
>
> Certainly I have seen it many times over the last few months testing
> various branches.
>
> Daire
>
>
>
>
>
>
> Dave Wysochanski (1):
>   Debug1 Daire crash in cachefiles_prepare_write
>
>  fs/cachefiles/io.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> --
> 2.31.1
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs
>
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

