Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B39F03683F1
	for <lists+linux-cachefs@lfdr.de>; Thu, 22 Apr 2021 17:44:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-iLZka9m_OLSHRee00UZaDQ-1; Thu, 22 Apr 2021 11:43:52 -0400
X-MC-Unique: iLZka9m_OLSHRee00UZaDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C52F681746C;
	Thu, 22 Apr 2021 15:43:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2755D6D3;
	Thu, 22 Apr 2021 15:43:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B63A1806D0F;
	Thu, 22 Apr 2021 15:43:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MFhhp0004784 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 11:43:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AAFC61054E49; Thu, 22 Apr 2021 15:43:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C291054F8E
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 15:43:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EED180080E
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 15:43:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-F9bH8XgUNjuNWRTG-Nm-Zw-1; Thu, 22 Apr 2021 11:43:31 -0400
X-MC-Unique: F9bH8XgUNjuNWRTG-Nm-Zw-1
Received: by mail-pj1-f53.google.com with SMTP id
	f2-20020a17090a4a82b02900c67bf8dc69so1198970pjh.1
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 08:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Fy9ZDMY1X3EZFzSlHtOl7Pxuf7qdaShXtVTSMwOnPN8=;
	b=kUnuc4tlk7mJPxxuyyFrXsMH48rscs/YtTEhJ/VB2oCeNS9k3b2LPne6hyQeO/fDoN
	H1fVa8msPIgbKvQzOImygg2YyVZpHaIg0ERt812qVWv2cp+gqypcdVf629/Da2L3KKXW
	mr0EJ/R/UXTI/r8u3NFeUMVhB5MLwsdWsHwNumF/mFd8I1hxXmHuOTk8hbgp9fgUNjVJ
	CFXDT7//6NZibP7H5HYrAlSYaLHo9bVzWOcCW70SEqN81bCYOZkX5fBmyg40TwVIACkQ
	7WxkDS9R6FmofEstP+LX+Nc9ePpE+zD3BgATsqbBmX+y3Mr7px0D6kkn5b3iWhP02SKR
	cPFw==
X-Gm-Message-State: AOAM530QHSoM5m0n3wH/6Rv4pk50mnPyRUjI/tjOIaBZcyjUzUZc+95n
	NQ1xuSRln81shXSBDRoOLvYxLQWxE5LJ3ZTbcSQeYOM6AtplIRfK1is=
X-Google-Smtp-Source: ABdhPJyPkpYFQEjqZWXXi7LjRGULO0z1UQad2ZVXTg2O5sb6rf2XWAr3lC24DaAV9RnC9oz/OjgQ8WTqzL70PvQ/jcI=
X-Received: by 2002:a17:902:ed06:b029:ec:7b39:9739 with SMTP id
	b6-20020a170902ed06b02900ec7b399739mr4001661pld.5.1619106210476;
	Thu, 22 Apr 2021 08:43:30 -0700 (PDT)
MIME-Version: 1.0
From: Nick Hall <nick.hall@goodbyekansas.co.uk>
Date: Thu, 22 Apr 2021 16:43:19 +0100
Message-ID: <CAJxsdCNDiKzhPHGkjqEhrERZ635dk_T3EqVLXOMZ=T6J+EJkow@mail.gmail.com>
To: linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] fsc stats in /proc/self/mountstats
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All,

Apologies if this is a basic question, but I'm trying to ascertain fs-cache
performance.

The howto.txt that comes with cachefs documents that data on pages written
and retrieved from the cache is exposed in /proc/sys/fs/nfs/

This is missing on my system (CentOS 7.9) but searching the web brought up
a SUSE KB article mentioning that the data has moved to
/proc/self/mountstats. And indeed here I see an fsc entry for each mounted
filesystem.

Some more web searching led me to a number of pages that detailed the
counters displayed as <rok> <rfl> <wok> <wfl> <unc>

"Where <rok> is the number of pages read successfully from the cache, <rfl>
is
the number of failed page reads against the cache, <wok> is the number of
successful page writes to the cache, <wfl> is the number of failed page
writes
to the cache, and <unc> is the number of NFS pages that have been
disconnected
from the cache."

However I notice the 'bytes' line in mountstats just above has exactly the
same values for its' counters Here are the respective lines from my system:

       bytes:  34808359984 16191849926 0 0 7750384932 16191871206 1892279
3953222
         fsc:    34808359984 16191849926 0 0 7750384932

I further read that the byte counters refer to:

" (linux/nfs_iostat.h: nfs_stat_bytecounters)

   1. normalreadbytes
   2. normalwritebytes
   3. directreadbytes
   4. directwritebytes
   5. serverreadbytes
   6. serverwritebytes (serverwrittenbytes)
   7. readpages
   8. writepages"

I'm confused as to why these values are the same. For example, is it likely
that the 5th value on each line of 77503841932 is correct for both "NFS
pages disconnected from the cache" and "server read bytes" ?

Thanks
Nick
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

