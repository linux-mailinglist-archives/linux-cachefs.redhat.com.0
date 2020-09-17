Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1D816270727
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Sep 2020 22:37:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-qd7mKHZiNfetxGRIyo-mjg-1; Fri, 18 Sep 2020 16:37:03 -0400
X-MC-Unique: qd7mKHZiNfetxGRIyo-mjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58A0A84635B;
	Fri, 18 Sep 2020 20:37:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 464881992F;
	Fri, 18 Sep 2020 20:37:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DFD48C7CD;
	Fri, 18 Sep 2020 20:37:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HG1kPO022312 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 12:01:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFF9F117A97D; Thu, 17 Sep 2020 16:01:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA370117A97A
	for <linux-cachefs@redhat.com>; Thu, 17 Sep 2020 16:01:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AAB6800962
	for <linux-cachefs@redhat.com>; Thu, 17 Sep 2020 16:01:44 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-219-XZTRUZzEMp-OBqx28oMUAg-1;
	Thu, 17 Sep 2020 12:01:40 -0400
X-MC-Unique: XZTRUZzEMp-OBqx28oMUAg-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 36BE1B0680B;
	Thu, 17 Sep 2020 17:01:38 +0100 (BST)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3je4s6HGCzxe; Thu, 17 Sep 2020 17:01:38 +0100 (BST)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 191BBB06809;
	Thu, 17 Sep 2020 17:01:38 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 1780C80F1D81;
	Thu, 17 Sep 2020 17:01:37 +0100 (BST)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wsjrLT35cdiY; Thu, 17 Sep 2020 17:01:37 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id BB38280EDFB9;
	Thu, 17 Sep 2020 17:01:25 +0100 (BST)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ri5mXHdgaUYB; Thu, 17 Sep 2020 17:01:25 +0100 (BST)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 42A2F80EDFBF;
	Thu, 17 Sep 2020 17:01:10 +0100 (BST)
Date: Thu, 17 Sep 2020 17:01:11 +0100 (BST)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
In-Reply-To: <20200915172140.GA32632@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: dwTmffFxritSIvyCsoLtMhvw7aelKw==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 18 Sep 2020 16:35:29 -0400
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 15 Sep, 2020, at 18:21, bfields bfields@fieldses.org wrote:

>> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per
>> second) quickly eat up the CPU on the re-export server and perf top
>> shows we are mostly in native_queued_spin_lock_slowpath.
> 
> Any statistics on who's calling that function?

I've always struggled to reproduce this with a simple open/close simulation, so I suspect some other operations need to be mixed in too. But I have one production workload that I know has lots of opens & closes (buggy software) included in amongst the usual reads, writes etc.

With just 40 clients mounting the reexport server (v5.7.6) using NFSv4.2, we see the CPU of the nfsd threads increase rapidly and by the time we have 100 clients, we have maxed out the 32 cores of the server with most of that in native_queued_spin_lock_slowpath.

The perf top summary looks like this:

# Overhead  Command          Shared Object                 Symbol                                                 
# ........  ...............  ............................  .......................................................
#
    82.91%  nfsd             [kernel.kallsyms]             [k] native_queued_spin_lock_slowpath
     8.24%  swapper          [kernel.kallsyms]             [k] intel_idle
     4.66%  nfsd             [kernel.kallsyms]             [k] __list_lru_walk_one
     0.80%  nfsd             [kernel.kallsyms]             [k] nfsd_file_lru_cb

And the call graph (not sure how this will format):

- nfsd
   - 89.34% svc_process
      - 88.94% svc_process_common
         - 88.87% nfsd_dispatch
            - 88.82% nfsd4_proc_compound
               - 53.97% nfsd4_open
                  - 53.95% nfsd4_process_open2
                     - 53.87% nfs4_get_vfs_file
                        - 53.48% nfsd_file_acquire
                           - 33.31% nfsd_file_lru_walk_list
                              - 33.28% list_lru_walk_node                    
                                 - 33.28% list_lru_walk_one                  
                                    - 30.21% _raw_spin_lock
                                       - 30.21% queued_spin_lock_slowpath
                                            30.20% native_queued_spin_lock_slowpath
                                      2.46% __list_lru_walk_one
                           - 19.39% list_lru_add
                              - 19.39% _raw_spin_lock
                                 - 19.39% queued_spin_lock_slowpath
                                      19.38% native_queued_spin_lock_slowpath
               - 34.46% nfsd4_close
                  - 34.45% nfs4_put_stid
                     - 34.45% nfs4_free_ol_stateid
                        - 34.45% release_all_access
                           - 34.45% nfs4_file_put_access
                              - 34.45% __nfs4_file_put_access.part.81
                                 - 34.45% nfsd_file_put
                                    - 34.44% nfsd_file_lru_walk_list
                                       - 34.40% list_lru_walk_node
                                          - 34.40% list_lru_walk_one
                                             - 31.27% _raw_spin_lock
                                                - 31.27% queued_spin_lock_slowpath
                                                     31.26% native_queued_spin_lock_slowpath
                                               2.50% __list_lru_walk_one
                                               0.50% nfsd_file_lru_cb


The original NFS server is mounted by the reexport server using NFSv4.2. As soon as we switch the clients to mount the reexport server with NFSv3, the high CPU usage goes away and we start to see expected performance for this workload and server hardware.

I'm happy to share perf data or anything else that is useful and I can repeatedly run this production load as required.

Cheers,

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

