Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 68DCB289C70
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Oct 2020 01:55:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-KBUnH5nUOCKXcg7RXlk6Ag-1; Fri, 09 Oct 2020 19:55:11 -0400
X-MC-Unique: KBUnH5nUOCKXcg7RXlk6Ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0489756BF5;
	Fri,  9 Oct 2020 23:55:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E985D60BFA;
	Fri,  9 Oct 2020 23:55:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D67371832FC3;
	Fri,  9 Oct 2020 23:55:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099Js2hH020710 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:54:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE0BB13BB85; Fri,  9 Oct 2020 19:54:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FD113BB87
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:54:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF38C858294
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:54:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-KzD-0kD8OvCKIW4q6mB8dQ-1; Fri, 09 Oct 2020 15:53:56 -0400
X-MC-Unique: KzD-0kD8OvCKIW4q6mB8dQ-1
IronPort-SDR: zni4CYhCvFPaVeOCsqyHygsiUKagCQCnf28B51YQbqnY0BPxdqHjYvtvzN43vWli6sYqSDtPK4
	av79ey4nNRmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165643369"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165643369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:54 -0700
IronPort-SDR: bZn0Zma13YkX7FJFkNsCYMjMNff2FSiB/MgoUwYT50qMOfu0yRYfZtOtUYx1uwuwPtN+tdFX+r
	hwly4wq6Ikyg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519847271"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:53 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:28 -0700
Message-Id: <20201009195033.3208459-54-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 09 Oct 2020 19:54:52 -0400
Cc: linux-aio@kvack.org, Song Liu <songliubraving@fb.com>,
	linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, John Fastabend <john.fastabend@gmail.com>,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org, Yonghong Song <yhs@fb.com>,
	linux-ext4@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
	Fenghua Yu <fenghua.yu@intel.com>, drbd-dev@tron.linbit.com,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	xen-devel@lists.xenproject.org, KP Singh <kpsingh@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
	linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH RFC PKS/PMEM 53/58] lib: Utilize new
	kmap_thread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKVGhlc2Uga21hcCgpIGNhbGxz
IGFyZSBsb2NhbGl6ZWQgdG8gYSBzaW5nbGUgdGhyZWFkLiAgVG8gYXZvaWQgdGhlIG92ZXIKaGVh
ZCBvZiBnbG9iYWwgUEtSUyB1cGRhdGVzIHVzZSB0aGUgbmV3IGttYXBfdGhyZWFkKCkgY2FsbC4K
CkNjOiBBbGV4YW5kZXIgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiAiSsOpcsO0
bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWFydGluIEthRmFpIExhdSA8a2Fm
YWlAZmIuY29tPgpDYzogU29uZyBMaXUgPHNvbmdsaXVicmF2aW5nQGZiLmNvbT4KQ2M6IFlvbmdo
b25nIFNvbmcgPHloc0BmYi5jb20+CkNjOiBBbmRyaWkgTmFrcnlpa28gPGFuZHJpaW5AZmIuY29t
PgpDYzogSm9obiBGYXN0YWJlbmQgPGpvaG4uZmFzdGFiZW5kQGdtYWlsLmNvbT4KQ2M6IEtQIFNp
bmdoIDxrcHNpbmdoQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogSXJhIFdlaW55IDxpcmEu
d2VpbnlAaW50ZWwuY29tPgotLS0KIGxpYi9pb3ZfaXRlci5jIHwgMTIgKysrKysrLS0tLS0tCiBs
aWIvdGVzdF9icGYuYyB8ICA0ICsrLS0KIGxpYi90ZXN0X2htbS5jIHwgIDggKysrKy0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2lvdl9pdGVyLmMgYi9saWIvaW92X2l0ZXIuYwppbmRleCA1ZTQwNzg2YzhmMTIu
LjFkNDdmOTU3Y2Y5NSAxMDA2NDQKLS0tIGEvbGliL2lvdl9pdGVyLmMKKysrIGIvbGliL2lvdl9p
dGVyLmMKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgc2l6ZV90IGNvcHlfcGFnZV90b19pdGVy
X2lvdmVjKHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QgYgogCX0KIAkv
KiBUb28gYmFkIC0gcmV2ZXJ0IHRvIG5vbi1hdG9taWMga21hcCAqLwogCi0Ja2FkZHIgPSBrbWFw
KHBhZ2UpOworCWthZGRyID0ga21hcF90aHJlYWQocGFnZSk7CiAJZnJvbSA9IGthZGRyICsgb2Zm
c2V0OwogCWxlZnQgPSBjb3B5b3V0KGJ1ZiwgZnJvbSwgY29weSk7CiAJY29weSAtPSBsZWZ0OwpA
QCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBzaXplX3QgY29weV9wYWdlX3RvX2l0ZXJfaW92ZWMo
c3RydWN0IHBhZ2UgKnBhZ2UsIHNpemVfdCBvZmZzZXQsIHNpemVfdCBiCiAJCWZyb20gKz0gY29w
eTsKIAkJYnl0ZXMgLT0gY29weTsKIAl9Ci0Ja3VubWFwKHBhZ2UpOworCWt1bm1hcF90aHJlYWQo
cGFnZSk7CiAKIGRvbmU6CiAJaWYgKHNraXAgPT0gaW92LT5pb3ZfbGVuKSB7CkBAIC0yOTIsNyAr
MjkyLDcgQEAgc3RhdGljIHNpemVfdCBjb3B5X3BhZ2VfZnJvbV9pdGVyX2lvdmVjKHN0cnVjdCBw
YWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QKIAl9CiAJLyogVG9vIGJhZCAtIHJldmVy
dCB0byBub24tYXRvbWljIGttYXAgKi8KIAotCWthZGRyID0ga21hcChwYWdlKTsKKwlrYWRkciA9
IGttYXBfdGhyZWFkKHBhZ2UpOwogCXRvID0ga2FkZHIgKyBvZmZzZXQ7CiAJbGVmdCA9IGNvcHlp
bih0bywgYnVmLCBjb3B5KTsKIAljb3B5IC09IGxlZnQ7CkBAIC0zMDksNyArMzA5LDcgQEAgc3Rh
dGljIHNpemVfdCBjb3B5X3BhZ2VfZnJvbV9pdGVyX2lvdmVjKHN0cnVjdCBwYWdlICpwYWdlLCBz
aXplX3Qgb2Zmc2V0LCBzaXplX3QKIAkJdG8gKz0gY29weTsKIAkJYnl0ZXMgLT0gY29weTsKIAl9
Ci0Ja3VubWFwKHBhZ2UpOworCWt1bm1hcF90aHJlYWQocGFnZSk7CiAKIGRvbmU6CiAJaWYgKHNr
aXAgPT0gaW92LT5pb3ZfbGVuKSB7CkBAIC0xNzQyLDEwICsxNzQyLDEwIEBAIGludCBpb3ZfaXRl
cl9mb3JfZWFjaF9yYW5nZShzdHJ1Y3QgaW92X2l0ZXIgKmksIHNpemVfdCBieXRlcywKIAkJcmV0
dXJuIDA7CiAKIAlpdGVyYXRlX2FsbF9raW5kcyhpLCBieXRlcywgdiwgLUVJTlZBTCwgKHsKLQkJ
dy5pb3ZfYmFzZSA9IGttYXAodi5idl9wYWdlKSArIHYuYnZfb2Zmc2V0OworCQl3Lmlvdl9iYXNl
ID0ga21hcF90aHJlYWQodi5idl9wYWdlKSArIHYuYnZfb2Zmc2V0OwogCQl3Lmlvdl9sZW4gPSB2
LmJ2X2xlbjsKIAkJZXJyID0gZigmdywgY29udGV4dCk7Ci0JCWt1bm1hcCh2LmJ2X3BhZ2UpOwor
CQlrdW5tYXBfdGhyZWFkKHYuYnZfcGFnZSk7CiAJCWVycjt9KSwgKHsKIAkJdyA9IHY7CiAJCWVy
ciA9IGYoJncsIGNvbnRleHQpO30pCmRpZmYgLS1naXQgYS9saWIvdGVzdF9icGYuYyBiL2xpYi90
ZXN0X2JwZi5jCmluZGV4IGNhN2Q2MzViY2NkOS4uNDQxZjgyMmY1NmJhIDEwMDY0NAotLS0gYS9s
aWIvdGVzdF9icGYuYworKysgYi9saWIvdGVzdF9icGYuYwpAQCAtNjUwNiwxMSArNjUwNiwxMSBA
QCBzdGF0aWMgdm9pZCAqZ2VuZXJhdGVfdGVzdF9kYXRhKHN0cnVjdCBicGZfdGVzdCAqdGVzdCwg
aW50IHN1YikKIAkJaWYgKCFwYWdlKQogCQkJZ290byBlcnJfa2ZyZWVfc2tiOwogCi0JCXB0ciA9
IGttYXAocGFnZSk7CisJCXB0ciA9IGttYXBfdGhyZWFkKHBhZ2UpOwogCQlpZiAoIXB0cikKIAkJ
CWdvdG8gZXJyX2ZyZWVfcGFnZTsKIAkJbWVtY3B5KHB0ciwgdGVzdC0+ZnJhZ19kYXRhLCBNQVhf
REFUQSk7Ci0JCWt1bm1hcChwYWdlKTsKKwkJa3VubWFwX3RocmVhZChwYWdlKTsKIAkJc2tiX2Fk
ZF9yeF9mcmFnKHNrYiwgMCwgcGFnZSwgMCwgTUFYX0RBVEEsIE1BWF9EQVRBKTsKIAl9CiAKZGlm
ZiAtLWdpdCBhL2xpYi90ZXN0X2htbS5jIGIvbGliL3Rlc3RfaG1tLmMKaW5kZXggZTdkYzNkZTM1
NWI3Li5lNDBkMjZmOTdmNDUgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0X2htbS5jCisrKyBiL2xpYi90
ZXN0X2htbS5jCkBAIC0zMjksOSArMzI5LDkgQEAgc3RhdGljIGludCBkbWlycm9yX2RvX3JlYWQo
c3RydWN0IGRtaXJyb3IgKmRtaXJyb3IsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCWlmICghcGFn
ZSkKIAkJCXJldHVybiAtRU5PRU5UOwogCi0JCXRtcCA9IGttYXAocGFnZSk7CisJCXRtcCA9IGtt
YXBfdGhyZWFkKHBhZ2UpOwogCQltZW1jcHkocHRyLCB0bXAsIFBBR0VfU0laRSk7Ci0JCWt1bm1h
cChwYWdlKTsKKwkJa3VubWFwX3RocmVhZChwYWdlKTsKIAogCQlwdHIgKz0gUEFHRV9TSVpFOwog
CQlib3VuY2UtPmNwYWdlcysrOwpAQCAtMzk4LDkgKzM5OCw5IEBAIHN0YXRpYyBpbnQgZG1pcnJv
cl9kb193cml0ZShzdHJ1Y3QgZG1pcnJvciAqZG1pcnJvciwgdW5zaWduZWQgbG9uZyBzdGFydCwK
IAkJaWYgKCFwYWdlIHx8IHhhX3BvaW50ZXJfdGFnKGVudHJ5KSAhPSBEUFRfWEFfVEFHX1dSSVRF
KQogCQkJcmV0dXJuIC1FTk9FTlQ7CiAKLQkJdG1wID0ga21hcChwYWdlKTsKKwkJdG1wID0ga21h
cF90aHJlYWQocGFnZSk7CiAJCW1lbWNweSh0bXAsIHB0ciwgUEFHRV9TSVpFKTsKLQkJa3VubWFw
KHBhZ2UpOworCQlrdW5tYXBfdGhyZWFkKHBhZ2UpOwogCiAJCXB0ciArPSBQQUdFX1NJWkU7CiAJ
CWJvdW5jZS0+Y3BhZ2VzKys7Ci0tIAoyLjI4LjAucmMwLjEyLmdiNmE2NThiZDAwYzkKCi0tCkxp
bnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcw==

