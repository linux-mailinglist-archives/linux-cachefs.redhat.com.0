Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5BB5E8330
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Sep 2022 22:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663964086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UI8qa8K/TVvr2+edKDeePYfLtXQnhEbbwwBmVhq5VpU=;
	b=RQsJv0VxsSutaef/meMiiy9cw7wui2OcN9ZaR8EqxRr0v93ez3rfmNxRK/nYv//WQ94mZF
	CyqAf0ODA6dE0eTNl/JLf/Ls5MlQO7zfznapuSeD+W39cFlXxbUQ3nOke8BF2MyeAaOkiA
	pSjNnv56kZ4Hb26P0tc9stVlLUl//fA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-jwhK1V7ZN522Gu0H65b1_A-1; Fri, 23 Sep 2022 16:14:43 -0400
X-MC-Unique: jwhK1V7ZN522Gu0H65b1_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BC55855304;
	Fri, 23 Sep 2022 20:14:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E54D6C15BA4;
	Fri, 23 Sep 2022 20:14:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7240119465B9;
	Fri, 23 Sep 2022 20:14:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D104B19465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 23 Sep 2022 20:14:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B062C2027062; Fri, 23 Sep 2022 20:14:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7530E2028DC1;
 Fri, 23 Sep 2022 20:14:40 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Daire Byrne <daire.byrne@gmail.com>,
	David Howells <dhowells@redhat.com>
Date: Fri, 23 Sep 2022 16:14:38 -0400
Message-Id: <20220923201439.1974099-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 0/1] Debug oops in cachefiles_prepare_write
 with NFS netfs conversion on reexport server
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Daire this debug patch is for your setup when you have time to test it.
Also I am not sure if David Howells has a theory as to what is happening
just from the oops and description below.  I will also keep looking a
bit more at what might be happening.

This patch should help debug the oops seen by Daire's re-export
server while running tests on some of my NFS fscache netfs conversion
patches.  This is only the first patch but should give at least
the next clues as to what is happening.

Add this patch on top of my v8 series just posted on Sep 22:
https://marc.info/?l=linux-nfs&m=166385481714542&w=4

Once built and booted, you should enable ftrace events for netfs,
cachefiles, and fscache.  To start with, use the following comprehensive
trace events.  Note I'm not using trace-cmd because I think you
mentioned this may not work due to the older userspace on your
machine.  If you use the /proc files you can also control the events:
 echo 1 > /sys/kernel/debug/tracing/events/cachefiles/enable 
 echo 1 > /sys/kernel/debug/tracing/events/fscache/enable 
 echo 1 > /sys/kernel/debug/tracing/events/netfs/enable 
 echo 1 > /sys/kernel/debug/tracing/tracing_on 

The above should be the equivalent of:
trace-cmd start -e netfs:* -e fscache:* -e cachefiles:*

You may need to increase buffer_size_kb:
 cat /sys/kernel/debug/tracing/buffer_size_kb 
1024
 echo 16384 > /sys/kernel/debug/tracing/buffer_size_kb
 cat /sys/kernel/debug/tracing/buffer_size_kb 
16384

Then make sure the following is set:
 sysctl kernel.ftrace_dump_on_oops=1
 sysctl kernel.panic_on_oops=1

Then reproduce the problem.  My current theory is detailed below, and if
it's on the mark, I'd expect to see the ftrace event buffer contain a
line like this:

[   99.078288] kworker/-140       5..... 27889469us : cachefiles_prepare_write: object == NULL: c=00000004

Then we can take the cookie value and hopefully discern the history of
the crash.  From the oops, below is my current theory of what is
happening.


Summary of oops
===============
Theory from oops decode and struct offsets (crash-utility) is that somehow
the cachefiles_object * is going to NULL while a write is going in progress.

If that is true, then look at how a cachefiles_object * value stored inside
fscache_cookie.cache_priv could be NULL.  There appears to be only one
possibility, and that is cachefiles_withdraw_cookie() was called despite
the fact that we are trying to write to the object.



Details on how cachefiles_object * could be NULL
================================================
[dwysocha@dwysocha kernel]$ grep -n "cache_priv =" fs/cachefiles/*.[ch]
fs/cachefiles/interface.c:188:	cookie->cache_priv = object;
fs/cachefiles/interface.c:373:	cookie->cache_priv = NULL;
fs/cachefiles/volume.c:80:	vcookie->cache_priv = volume;
fs/cachefiles/volume.c:114:	volume->vcookie->cache_priv = NULL;
[dwysocha@dwysocha kernel]$ 


346 /*
347  * Withdraw caching for a cookie.
348  */
349 static void cachefiles_withdraw_cookie(struct fscache_cookie *cookie)
350 {
351         struct cachefiles_object *object = cookie->cache_priv;
352         struct cachefiles_cache *cache = object->volume->cache;
353         const struct cred *saved_cred;
354 
355         _enter("o=%x", object->debug_id);
356         cachefiles_see_object(object, cachefiles_obj_see_withdraw_cookie);
357 
358         if (!list_empty(&object->cache_link)) {
359                 spin_lock(&cache->object_list_lock);
360                 cachefiles_see_object(object, cachefiles_obj_see_withdrawal);
361                 list_del_init(&object->cache_link);
362                 spin_unlock(&cache->object_list_lock);
363         }
364 
365         cachefiles_ondemand_clean_object(object);
366 
367         if (object->file) {
368                 cachefiles_begin_secure(cache, &saved_cred);
369                 cachefiles_clean_up_object(object, cache);
370                 cachefiles_end_secure(cache, saved_cred);
371         }
372 
373         cookie->cache_priv = NULL;
374         cachefiles_put_object(object, cachefiles_obj_put_detach);
375 }

Since this is not a volume, the above is the only possibility for how
cookie->cache_prive == NULL, aside from memory corruption, which
seems unlikely given the predictable nature of the crashes.



Details on how we conclude cachefiles_object * == NULL
======================================================

First, netfs_cache_resources * cannot be null because the caller
netfs_rreq_do_write_to_cache() does the below to set 'cres' before
passing 'cres' to cachefiles_prepare_write:
	struct netfs_cache_resources *cres = &rreq->cache_resources;

crash> struct -o netfs_cache_resources.cache_priv
struct netfs_cache_resources {
   [8] void *cache_priv;
}

It's possible that 'netfs_cache_resources.cache_priv' value is NULL.
But that would not explain the offset of 32 into the structure
for the next dereference - this is not where we panic (we panic
on a address of 0000000000000008, not 0000000000000032)

crash> struct -o fscache_cookie.cache_priv
struct fscache_cookie {
   [32] void *cache_priv;
}

So clearly the above is not NULL.  However, the value of fscache_cookie.cache_priv
is possible to be NULL since the offset of 'volume' member is 8.  So if the
cachefiles_object * which is stored inside fscache_cookie.cache_priv == NULL,
this would explain the crash.

crash> struct -o cachefiles_object.volume
struct cachefiles_object {
   [8] struct cachefiles_volume *volume;
}
crash> 




From Daire

58710.346376] BUG: kernel NULL pointer dereference, address: 0000000000000008
[58710.353508] #PF: supervisor read access in kernel mode
[58710.358775] #PF: error_code(0x0000) - not-present page
[58710.364041] PGD 0 P4D 0
[58710.366721] Oops: 0000 [#1] PREEMPT SMP NOPTI
[58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G E      6.0.0-2.dneg.x86_64 #1
[58710.380647] Hardware name: Google Google Compute Engine/Google
Compute Engine, BIOS Google 07/22/2022
[58710.389995] Workqueue: events_unbound netfs_rreq_write_to_cache_work [netfs]
[58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]



#./scripts/faddr2line --list fs/cachefiles/cachefiles.ko
cachefiles_prepare_write+0x2
cachefiles_prepare_write+0x28/0x90:

cachefiles_prepare_write at
/user_data/rpmbuild/BUILD/kernel-ml-6.0.0/linux-6.0.0-2.dneg.x86_64/fs/cachefiles/io.c:587
 582 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 583     loff_t *_start, size_t *_len, loff_t i_size,
 584     bool no_space_allocated_yet)
 585 {
 586 struct cachefiles_object *object = cachefiles_cres_object(cres);
>587< struct cachefiles_cache *cache = object->volume->cache;
 588 const struct cred *saved_cred;
 589 int ret;
 590
 591 if (!cachefiles_cres_file(cres)) {
 592 if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))

#./scripts/faddr2line --list fs/netfs/netfs.ko
netfs_rreq_write_to_cache_work+0x11c
netfs_rreq_write_to_cache_work+0x11c/0x320:

netfs_rreq_do_write_to_cache at
/user_data/rpmbuild/BUILD/kernel-ml-6.0.0/linux-6.0.0-2.dneg.x86_64/fs/netfs/io.c:200
 195 list_del_init(&next->rreq_link);
 196 netfs_put_subrequest(next, false,
 197      netfs_sreq_trace_put_merged);
 198 }
 199
>200< ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
 201        rreq->i_size, true);
 202 if (ret < 0) {
 203 trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
 204 trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
 205 continue;

(inlined by) netfs_rreq_write_to_cache_work at
/user_data/rpmbuild/BUILD/kernel-ml-6.0.0/linux-6.0.0-2.dneg.x86_64/fs/netfs/io.c:229
 224 static void netfs_rreq_write_to_cache_work(struct work_struct *work)
 225 {
 226 struct netfs_io_request *rreq =
 227 container_of(work, struct netfs_io_request, work);
 228
>229< netfs_rreq_do_write_to_cache(rreq);
 230 }
 231
 232 static void netfs_rreq_write_to_cache(struct netfs_io_request *rreq)
 233 {
 234 rreq->work.func = netfs_rreq_write_to_cache_work;




162 /*
163  * Perform any outstanding writes to the cache.  We inherit a ref from the
164  * caller.
165  */
166 static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
167 {
168         struct netfs_cache_resources *cres = &rreq->cache_resources; <--- THIS CANNOT BE NULL ????
169         struct netfs_io_subrequest *subreq, *next, *p;
170         struct iov_iter iter;
171         int ret;
172 
173         trace_netfs_rreq(rreq, netfs_rreq_trace_copy);
174 
175         /* We don't want terminating writes trying to wake us up whilst we're
176          * still going through the list.
177          */
178         atomic_inc(&rreq->nr_copy_ops);
179 
180         list_for_each_entry_safe(subreq, p, &rreq->subrequests, rreq_link) {
181                 if (!test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags)) {
182                         list_del_init(&subreq->rreq_link);
183                         netfs_put_subrequest(subreq, false,
184                                              netfs_sreq_trace_put_no_copy);
185                 }
186         }
187 
188         list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
189                 /* Amalgamate adjacent writes */
190                 while (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
191                         next = list_next_entry(subreq, rreq_link);
192                         if (next->start != subreq->start + subreq->len)
193                                 break;
194                         subreq->len += next->len;
195                         list_del_init(&next->rreq_link);
196                         netfs_put_subrequest(next, false,
197                                              netfs_sreq_trace_put_merged);
198                 }
199 
200                 ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,  <--- PRESUMABLY WE ARE HERE ???
201                                                rreq->i_size, true);







[58710.346376] BUG: kernel NULL pointer dereference, address: 0000000000000008
[58710.353508] #PF: supervisor read access in kernel mode
[58710.358775] #PF: error_code(0x0000) - not-present page
[58710.364041] PGD 0 P4D 0
[58710.366721] Oops: 0000 [#1] PREEMPT SMP NOPTI
[58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G
     E      6.0.0-2.dneg.x86_64 #1
[58710.380647] Hardware name: Google Google Compute Engine/Google
Compute Engine, BIOS Google 07/22/2022
[58710.389995] Workqueue: events_unbound netfs_rreq_write_to_cache_work [netfs]
[58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
[58710.403767] Code: 00 00 0f 1f 44 00 00 41 57 49 89 d7 41 56 41 55
41 54 49 89 f4 55 44 89 c5 53 48 8b 47 08 48 89 fb 48 83 7f 10 00 4c
8b 70 20 <49> 8b 46 08 4c 8b 28 74 3f 49 8b 7d 50 e8 66 c6 0b cd 48 8b
73 10
[58710.422676] RSP: 0018:ffffb6e12728bde8 EFLAGS: 00010286
[58710.428031] RAX: ffff93649754b970 RBX: ffff9335925e38f0 RCX: 00000000030cb5e8
[58710.435303] RDX: ffff9335123653e0 RSI: ffff9335123653d8 RDI: ffff9335925e38f0
[58710.442567] RBP: 0000000000000001 R08: 0000000000000001 R09: 8080808080808080
[58710.449833] R10: ffff9335900444f4 R11: 000000000000000f R12: ffff9335123653d8
[58710.457109] R13: ffff9335925e38f0 R14: 0000000000000000 R15: ffff9335123653e0
[58710.464374] FS:  0000000000000000(0000) GS:ffff93733f900000(0000)
knlGS:0000000000000000
[58710.472593] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[58710.478480] CR2: 0000000000000008 CR3: 0000004055e56003 CR4: 00000000003706e0
[58710.485767] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[58710.493037] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[58710.500316] Call Trace:
[58710.502894]  <TASK>
[58710.505126]  netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
[58710.511201]  process_one_work+0x217/0x3e0
[58710.515358]  worker_thread+0x4a/0x3b0
[58710.519152]  ? process_one_work+0x3e0/0x3e0
[58710.523467]  kthread+0xd6/0x100
[58710.526740]  ? kthread_complete_and_exit+0x20/0x20
[58710.531659]  ret_from_fork+0x1f/0x30
[58710.535370]  </TASK>
[58710.537702] Modules linked in: rpcsec_gss_krb5(E) tcp_diag(E)
inet_diag(E) nfsv3(E) nfs(E) cachefiles(E) fscache(E) netfs(E) ext4(E)
mbcache(E) jbd2(E) intel_rapl_msr(E) intel_rapl_common(E) sg(E)
nfit(E) libnvdimm(E) i2c_piix4(E) rapl(E) nfsd(E) auth_rpcgss(E)
sch_fq(E) nfs_acl(E) lockd(E) tcp_bbr(E) grace(E) binfmt_misc(E)
ip_tables(E) xfs(E) libcrc32c(E) sd_mod(E) t10_pi(E)
crc64_rocksoft_generic(E) crc64_rocksoft(E) crc64(E) 8021q(E) garp(E)
mrp(E) stp(E) crct10dif_pclmul(E) llc(E) crc32_pclmul(E)
crc32c_intel(E) scsi_transport_iscsi(E) ghash_clmulni_intel(E)
serio_raw(E) virtio_scsi(E) gve(E) sunrpc(E) dm_mirror(E)
dm_region_hash(E) dm_log(E) dm_mod(E) fuse(E)
[58710.596756] CR2: 0000000000000008
[58710.600204] ---[ end trace 0000000000000000 ]---
[58710.604952] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
[58710.611534] Code: 00 00 0f 1f 44 00 00 41 57 49 89 d7 41 56 41 55
41 54 49 89 f4 55 44 89 c5 53 48 8b 47 08 48 89 fb 48 83 7f 10 00 4c
8b 70 20 <49> 8b 46 08 4c 8b 28 74 3f 49 8b 7d 50 e8 66 c6 0b cd 48 8b
73 10
[58710.630429] RSP: 0018:ffffb6e12728bde8 EFLAGS: 00010286
[58710.635799] RAX: ffff93649754b970 RBX: ffff9335925e38f0 RCX: 00000000030cb5e8
[58710.643077] RDX: ffff9335123653e0 RSI: ffff9335123653d8 RDI: ffff9335925e38f0
[58710.650342] RBP: 0000000000000001 R08: 0000000000000001 R09: 8080808080808080
[58710.657607] R10: ffff9335900444f4 R11: 000000000000000f R12: ffff9335123653d8
[58710.664872] R13: ffff9335925e38f0 R14: 0000000000000000 R15: ffff9335123653e0
[58710.672142] FS:  0000000000000000(0000) GS:ffff93733f900000(0000)
knlGS:0000000000000000
[58710.680362] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[58710.686238] CR2: 0000000000000008 CR3: 0000004055e56003 CR4: 00000000003706e0
[58710.693503] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[58710.700767] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[58710.708031] Kernel panic - not syncing: Fatal exception
[58710.714064] Kernel Offset: 0xc600000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[58710.724898] ---[ end Kernel panic - not syncing: Fatal exception ]---

I think I reported this one (or similar before) but to be honest, I
have lost track of whether I have only seen it in your branches or I
have seen it in the vanilla kernel too?

Certainly I have seen it many times over the last few months testing
various branches.

Daire






Dave Wysochanski (1):
  Debug1 Daire crash in cachefiles_prepare_write

 fs/cachefiles/io.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

