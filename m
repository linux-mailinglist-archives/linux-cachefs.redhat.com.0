Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A82DB50861A
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Apr 2022 12:39:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Oa7iDh5zPTWSCTVix6CrNg-1; Wed, 20 Apr 2022 06:39:08 -0400
X-MC-Unique: Oa7iDh5zPTWSCTVix6CrNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35A9685A5BE;
	Wed, 20 Apr 2022 10:39:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E50BF40CF8F5;
	Wed, 20 Apr 2022 10:39:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C34C21949763;
	Wed, 20 Apr 2022 10:39:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A00B519452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 20 Apr 2022 08:52:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E6B3112C242; Wed, 20 Apr 2022 08:52:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892EB112C240
 for <linux-cachefs@redhat.com>; Wed, 20 Apr 2022 08:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FF8F296A615
 for <linux-cachefs@redhat.com>; Wed, 20 Apr 2022 08:52:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-CKYdrYuPPR60ncXt_jeMpw-1; Wed, 20 Apr 2022 04:52:26 -0400
X-MC-Unique: CKYdrYuPPR60ncXt_jeMpw-1
Received: by mail-pf1-f180.google.com with SMTP id i24so1341640pfa.7
 for <linux-cachefs@redhat.com>; Wed, 20 Apr 2022 01:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2LGRC6pWV6Ywn7mMz+zxUWN4pMWlUSKe4QJbsCplYOw=;
 b=oKCDoDWyaWryKMcHUwmEiO18f+q/48sKK0Ts5NA/crAvcNrEaaEdBEkYn29pxn8w7n
 QYj7l6dA7me2f8TOTusiuZbxVqLKKleCSFJIR+p9ZVNQ9ORyyFuEV6TNih63JA5YtQX9
 TOVFHhzGGp1050i2IFsHmfnG2MuxIv566cCBukXeSPAvXn29QZGduaSWALkU4O2SYbVq
 Jl+KnQPsPwpTPVaBwUB0Hadpu9HBLQAMTlR5hVjbCjPoQ5LL8LCQ2YkXfLPQMgvN80G2
 JuCVE1tRDzyNijHkq1PyGxyyFw7yK79TiMoldTtdCRtMsssSkQZflWg1bA6N8LGDjlyD
 AoKw==
X-Gm-Message-State: AOAM532Zvc7GbBXr18N2Uggb1W4iDbpmPkmxRh6cml5VOW5c2E4JQvzi
 pUJYjidQkwM4CdS/Q1vry4MHeg==
X-Google-Smtp-Source: ABdhPJxDum90+rP9lDhOHilJaUU2EM8vLj6g8aSQheb52Th5oWgmS+xVi7Wr68uLh+gVI1rcN058YQ==
X-Received: by 2002:a63:3fcb:0:b0:3aa:36aa:33e8 with SMTP id
 m194-20020a633fcb000000b003aa36aa33e8mr6631178pga.492.1650444745388; 
 Wed, 20 Apr 2022 01:52:25 -0700 (PDT)
Received: from [10.76.37.214] ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056a00198800b004fab740dbe6sm20589421pfl.15.2022.04.20.01.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 01:52:25 -0700 (PDT)
Message-ID: <0cf8740a-cb1d-756d-01f2-b4e53fe2a63e@bytedance.com>
Date: Wed, 20 Apr 2022 16:52:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: Jeffle Xu <jefflexu@linux.alibaba.com>, xiang@kernel.org
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
From: JiaZhu <zhujia.zj@bytedance.com>
In-Reply-To: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Wed, 20 Apr 2022 10:39:04 +0000
Subject: Re: [Linux-cachefs] [PATCH v9 00/21] fscache,
 erofs: fscache-based on-demand read semantics
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
Cc: zhujia.zj@bytedance.com, linux-erofs@lists.ozlabs.org,
 gregkh@linuxfoundation.org, chao@kernel.org, fannaihao@baidu.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggNC8xNS8yMiA4OjM1IFBNLCBKZWZmbGUgWHUg5YaZ6YGTOgo+IGNoYW5nZXMgc2luY2Ug
djg6Cj4gLSByZWJhc2UgdG8gNS4xOC1yYzIKPiAtIGNhY2hlZmlsZXM6IHVzZSBvYmplY3RfaWQg
cmF0aGVyIHRoYW4gYW5vbl9mZCB0byB1bmlxdWVseSBpZGVudGlmeSBhCj4gICAgY2FjaGVmaWxl
IG9iamVjdCB0byBhdm9pZCBwb3RlbnRpYWwgaXNzdWVzIHdoZW4gdGhlIHVzZXIgbW92ZXMgdGhl
Cj4gICAgYW5vbnltb3VzIGZkIGFyb3VuZCwgZS5nLiB0aHJvdWdoIGR1cCgpIChyZWZlciB0byBj
b21taXQgbWVzc2FnZSBhbmQKPiAgICBjYWNoZWZpbGVzX29uZGVtYW5kX2dldF9mZCgpIG9mIHBh
dGNoIDIgZm9yIG1vcmUgZGV0YWlscykKPiAgICAoRGF2aWQgSG93ZWxscykKPiAtIGNhY2hlZmls
ZXM6IGFkZCBAdW5iaW5kX3BpbmNvdW50IHJlZmNvdW50IHRvIGF2b2lkIHRoZSBwb3RlbnRpYWwg
ZGVhZGxvY2sKPiAgICAocmVmZXIgdG8gY29tbWl0IG1lc3NhZ2Ugb2YgcGF0Y2gzIGZvciBtb3Jl
IGRldGFpbHMpCj4gLSBjYWNoZWZpbGVzOiBtb3ZlIHRoZSBjYWxsaW5nIHNpdGUgb2YgY2FjaGVm
aWxlc19vbmRlbWFuZF9yZWFkKCkgZnJvbQo+ICAgIGNhY2hlZmlsZXNfcmVhZCgpIHRvIGNhY2Vo
ZmlsZXNfcHJlcF9yZWFkKCkgKHJlZmVyIHRvIGNvbW1pdCBtZXNzYWdlCj4gICAgb2YgcGF0Y2gg
NSBmb3IgbW9yZSBkZXRhaWxzKQo+IC0gY2FjaGVmaWxlczogYWRkIHRyYWNlcG9pbnRzIChwYXRj
aCA3KSAoRGF2aWQgSG93ZWxscykKPiAtIGNhY2hlZmlsZXM6IHVwZGF0ZSBkb2N1bWVudGF0aW9u
IChwYXRjaCA4KSAoRGF2aWQgSG93ZWxscykKPiAtIGVyb2ZzOiB1cGRhdGUgUmV2aWV3ZWQtYnkg
dGFnIGZyb20gR2FvIFhpYW5nCj4gLSBlcm9mczogbW92ZSB0aGUgbG9naWMgb2YgaW5pdGlhbGl6
aW5nIGJkZXYvZGF4X2RldiBpbiBmc2NhY2hlIG1vZGUgb3V0Cj4gICAgZnJvbSBwYXRjaCAxNS8y
MC4gSW5zdGVhZCBtb3ZlIGl0IGludG8gcGF0Y2ggOSwgc28gdGhhdCBwYXRjaCAyMCBjYW4KPiAg
ICBmb2N1cyBvbiB0aGUgbW91bnQgb3B0aW9uIGhhbmRsaW5nCj4gLSBlcm9mczogdXBkYXRlIHRo
ZSBzdWJqZWN0IGxpbmUgYW5kIGNvbW1pdCBtZXNzYWdlIG9mIHBhdGNoIDEyIChHYW8KPiAgICBY
aWFuZykKPiAtIGVyb2ZzOiByZW1vdmUgYW5kIGZvbGQgZXJvZnNfZnNjYWNoZV9nZXRfZm9saW8o
KSBoZWxwZXIgKHBhdGNoIDE2KQo+ICAgIChHYW8gWGlhbmcpCj4gLSBlcm9mczogY2hhbmdlIGtt
YXAoKSB0byBrYW1wX2xvYWNsX2ZvbGlvKCksIGFuZCBjb21tZW50IGNsZWFudXAgKHBhdGNoCj4g
ICAgMTgpIChHYW8gWGlhbmcpCj4gLSB1cGRhdGUgImFkdmFudGFnZSBvZiBmc2NhY2hlLWJhc2Vk
IG9uLWRlbWFuZCByZWFkIiBzZWN0aW9uIG9mIHRoZQo+ICAgIGNvdmVyIGxldHRlcgo+IC0gd2Un
dmUgZmluaXNoZWQgYSBwcmVsaW1pbmFyeSBlbmQtdG8tZW5kIG9uLWRlbWFuZCBkb3dubG9hZCBk
YWVtb24gaW4KPiAgICBvcmRlciB0byB0ZXN0IHRoZSBmc2NhY2hlIG9uLWRlbWFuZCBrZXJuZWwg
Y29kZSBhcyBhIHJlYWwgZW5kLXRvLWVuZAo+ICAgIHdvcmtsb2FkIGZvciBjb250YWluZXIgdXNl
IGNhc2VzLiBUaGUgdGVzdCB1c2VyIGd1aWRlIGlzIGFkZGVkIGluIHRoZQo+ICAgIGNvdmVyIGxl
dHRlci4KPiAtIFRoYW5rcyBaaWNoZW4gVGlhbiBmb3IgdGVzdGluZwo+ICAgIFRlc3RlZC1ieTog
WmljaGVuIFRpYW4gPHRpYW56aWNoZW5Aa3VhaXNob3UuY29tPgo+IAo+IAo+IEtlcm5lbCBQYXRj
aHNldAo+IC0tLS0tLS0tLS0tLS0tLQo+IEdpdCB0cmVlOgo+IAo+ICAgICAgaHR0cHM6Ly9naXRo
dWIuY29tL2xvc3RqZWZmbGUvbGludXguZ2l0IGppbmdiby9kZXYtZXJvZnMtZnNjYWNoZS12OQo+
IAo+IEdpdHdlYjoKPiAKPiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9sb3N0amVmZmxlL2xpbnV4
L2NvbW1pdHMvamluZ2JvL2Rldi1lcm9mcy1mc2NhY2hlLXY5Cj4gCj4gCj4gVXNlciBHdWlkZSBm
b3IgRTJFIENvbnRhaW5lciBVc2UgQ2FzZQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBVc2VyIGd1aWRlOgo+IAo+ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL2RyYWdv
bmZseW9zcy9pbWFnZS1zZXJ2aWNlL2Jsb2IvZnNjYWNoZS9kb2NzL255ZHVzLWZzY2FjaGUubWQK
PiAKPiBWaWRlbzoKPiAKPiAgICAgIGh0dHBzOi8veW91dHUuYmUvRjRJRjJfREVOWG8KPiAKPiAK
PiBVc2VyIERhZW1vbiBmb3IgUXVpY2sgVGVzdAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gR2l0IHRyZWU6Cj4gCj4gICAgICBodHRwczovL2dpdGh1Yi5jb20vbG9zdGplZmZsZS9kZW1h
bmQtcmVhZC1jYWNoZWZpbGVzZC5naXQgbWFpbgo+IAo+IEdpdHdlYjoKPiAKPiAgICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9sb3N0amVmZmxlL2RlbWFuZC1yZWFkLWNhY2hlZmlsZXNkCj4gCj4gCj4g
UkZDOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWWJSTDJnbEd6amZaa1ZiSEBCLVA3VFFN
RDZNLTAxNDYubG9jYWwvdC8KPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC80Nzgz
MTg3NS00YmRkLTgzOTgtOWYyZC0wNDY2YjMxYTQzODJAbGludXguYWxpYmFiYS5jb20vVC8KPiB2
MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzI5NDZkODcxLWI5ZTEtY2YyOS02ZDM5LWJj
YWIzMGYyODU0ZkBsaW51eC5hbGliYWJhLmNvbS90Lwo+IHYzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjIwMjA5MDYwMTA4LjQzMDUxLTEtamVmZmxleHVAbGludXguYWxpYmFiYS5j
b20vVC8KPiB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDMwNzEyMzMwNS43
OTUyMC0xLWplZmZsZXh1QGxpbnV4LmFsaWJhYmEuY29tL1QvI3QKPiB2NTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIyMDMxNzA5MTIuZ2syc3FrYUstbGtwQGludGVsLmNvbS9ULwo+
IHY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIwMzI2MDcyMC51QTVvN2s1dy1s
a3BAaW50ZWwuY29tL1QvCj4gdjc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNTU3YmNm
NzUtMjMzNC01ZmJiLWQyZTAtYzY1ZTk2ZGE1NjZkQGxpbnV4LmFsaWJhYmEuY29tL1QvCj4gdjg6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hYzg1NzFiOC0wOTM1LTFmNGYtZTlmMS1lNDI0
ZjA1OWI1ZWRAbGludXguYWxpYmFiYS5jb20vVC8KPiAKPiAKPiBbQmFja2dyb3VuZF0KPiA9PT09
PT09PT09PT0KPiBOeWR1cyBbMV0gaXMgYW4gaW1hZ2UgZGlzdHJpYnV0aW9uIHNlcnZpY2UgZXNw
ZWNpYWxseSBvcHRpbWl6ZWQgZm9yCj4gZGlzdHJpYnV0aW9uIG92ZXIgbmV0d29yay4gTnlkdXMg
aXMgYW4gZXhjZWxsZW50IGNvbnRhaW5lciBpbWFnZQo+IGFjY2VsZXJhdGlvbiBzb2x1dGlvbiwg
c2luY2UgaXQgb25seSBwdWxscyBkYXRhIGZyb20gcmVtb3RlIHdoZW4gbmVlZGVkLAo+IGEuay5h
LiBvbi1kZW1hbmQgcmVhZGluZyBhbmQgaXQgYWxzbyBzdXBwb3J0cyBjaHVuay1iYXNlZCBkZWR1
cGxpY2F0aW9uLAo+IGNvbXByZXNzaW9uLCBldGMuCj4gCj4gZXJvZnMgKEVuaGFuY2VkIFJlYWQt
T25seSBGaWxlIFN5c3RlbSkgaXMgYSBmaWxlc3lzdGVtIGRlc2lnbmVkIGZvcgo+IHJlYWQtb25s
eSBzY2VuYXJpb3MuIChEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW0vZXJvZnMucnN0KQo+IAo+IE92
ZXIgdGhlIHBhc3QgbW9udGhzIHdlJ3ZlIGJlZW4gZm9jdXNpbmcgb24gc3VwcG9ydGluZyBOeWR1
cyBpbWFnZSBzZXJ2aWNlCj4gd2l0aCBpbi1rZXJuZWwgZXJvZnMgZm9ybWF0WzJdLiBJbiB0aGF0
IGNhc2UsIGVhY2ggY29udGFpbmVyIGltYWdlIHdpbGwgYmUKPiBvcmdhbml6ZWQgaW4gb25lIGJv
b3RzdHJhcCAobWV0YWRhdGEpIGFuZCAob3B0aW9uYWwpIG11bHRpcGxlIGRhdGEgYmxvYnMgaW4K
PiBlcm9mcyBmb3JtYXQuIE1hc3NpdmUgY29udGFpbmVyIGltYWdlcyB3aWxsIGJlIHN0b3JlZCBv
biBvbmUgbWFjaGluZS4KPiAKPiBUbyBhY2NlbGVyYXRlIHRoZSBjb250YWluZXIgc3RhcnR1cCAo
ZmV0Y2hpbmcgY29udGFpbmVyIGltYWdlcyBmcm9tIHJlbW90ZQo+IGFuZCB0aGVuIHN0YXJ0IHRo
ZSBjb250YWluZXIpLCB3ZSBkbyBob3BlIHRoYXQgdGhlIGJvb3RzdHJhcCAmIGJsb2IgZmlsZXMK
PiBjb3VsZCBzdXBwb3J0IG9uLWRlbWFuZCByZWFkLiBUaGF0IGlzLCBlcm9mcyBjYW4gYmUgbW91
bnRlZCBhbmQgYWNjZXNzZWQKPiBldmVuIHdoZW4gdGhlIGJvb3RzdHJhcC9kYXRhIGJsb2IgZmls
ZXMgaGF2ZSBub3QgYmVlbiBmdWxseSBkb3dubG9hZGVkLgo+IFRoZW4gaXQnbGwgaGF2ZSBuYXRp
dmUgcGVyZm9ybWFuY2UgYWZ0ZXIgZGF0YSBpcyBhdmFpbGFibGUgbG9jYWxseS4KPiAKPiBUaGF0
IG1lYW5zIHdlIGhhdmUgdG8gbWFuYWdlIHRoZSBjYWNoZSBzdGF0ZSBvZiB0aGUgYm9vdHN0cmFw
L2RhdGEgYmxvYgo+IGZpbGVzIChpZiBjYWNoZSBoaXQsIHJlYWQgZGlyZWN0bHkgZnJvbSB0aGUg
bG9jYWwgY2FjaGU7IGlmIGNhY2hlIG1pc3MsCj4gZmV0Y2ggdGhlIGRhdGEgc29tZWhvdykuIEl0
IHdvdWxkIGJlIHBhaW5mdWwgYW5kIG1heSBiZSBkdW1iIGZvciBlcm9mcyB0bwo+IGltcGxlbWVu
dCB0aGUgY2FjaGUgbWFuYWdlbWVudCBpdHNlbGYuIFRodXMgd2UgcHJlZmVyIGZzY2FjaGUvY2Fj
aGVmaWxlcwo+IHRvIGRvIHRoZSBjYWNoZSBtYW5hZ2VtZW50IGluc3RlYWQuCj4gCj4gVGhlIGZz
Y2FjaGUgb24tZGVtYW5kIHJlYWQgZmVhdHVyZSBhaW1zIHRvIGJlIGltcGxlbWVudGVkIGluIGEg
Z2VuZXJpYyB3YXkKPiBzbyB0aGF0IGl0IGNhbiBiZW5lZml0IG90aGVyIHVzZSBjYXNlcyBhbmQv
b3IgZmlsZXN5c3RlbXMgaWYgaXQncwo+IGltcGxlbWVudGVkIGluIHRoZSBmc2NhY2hlIHN1YnN5
c3RlbS4KPiAKPiBbMV0gaHR0cHM6Ly9ueWR1cy5kZXYKPiBbMl0gaHR0cHM6Ly9zY2hlZC5jby9w
Y2RMCj4gCj4gCj4gW092ZXJhbGwgRGVzaWduXQo+ID09PT09PT09PT09PT09PT0KPiBQbGVhc2Ug
cmVmZXIgdG8gcGF0Y2ggNyAoImNhY2hlZmlsZXM6IGRvY3VtZW50IG9uLWRlbWFuZCByZWFkIG1v
ZGUiKSBmb3IKPiBtb3JlIGRldGFpbHMuCj4gCj4gV2hlbiB3b3JraW5nIGluIHRoZSBvcmlnaW5h
bCBtb2RlLCBjYWNoZWZpbGVzIG1haW5seSBzZXJ2ZXMgYXMgYSBsb2NhbCBjYWNoZQo+IGZvciBy
ZW1vdGUgbmV0d29ya2luZyBmcywgd2hpbGUgaW4gb24tZGVtYW5kIHJlYWQgbW9kZSwgY2FjaGVm
aWxlcyBjYW4gd29yawo+IGluIHRoZSBzY2VuYXJpbyB3aGVyZSBvbi1kZW1hbmQgcmVhZCBzZW1h
bnRpY3MgaXMgbmVlZGVkLCBlLmcuIGNvbnRhaW5lciBpbWFnZQo+IGRpc3RyaWJ1dGlvbi4KPiAK
PiBUaGUgZXNzZW50aWFsIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVzZSB0d28gbW9kZXMgaXMgdGhh
dCwgaW4gb3JpZ2luYWwgbW9kZSwKPiB3aGVuIGNhY2hlIG1pc3MsIG5ldGZzIGl0c2VsZiB3aWxs
IGZldGNoIGRhdGEgZnJvbSByZW1vdGUsIGFuZCB0aGVuIHdyaXRlIHRoZQo+IGZldGNoZWQgZGF0
YSBpbnRvIGNhY2hlIGZpbGUuIFdoaWxlIGluIG9uLWRlbWFuZCByZWFkIG1vZGUsIGEgdXNlciBk
YWVtb24gaXMKPiByZXNwb25zaWJsZSBmb3IgZmV0Y2hpbmcgZGF0YSBhbmQgdGhlbiBmZWVkcyB0
byB0aGUga2VybmVsIGZzY2FjaGUgc2lkZS4KPiAKPiBUaGUgb24tZGVtYW5kIHJlYWQgbW9kZSBy
ZWxpZXMgb24gYSBzaW1wbGUgcHJvdG9jb2wgdXNlZCBmb3IgY29tbXVuaWNhdGlvbgo+IGJldHdl
ZW4ga2VybmVsIGFuZCB1c2VyIGRhZW1vbi4KPiAKPiBUaGUgcHJvcG9zZWQgaW1wbGVtZW50YXRp
b24gcmVsaWVzIG9uIHRoZSBhbm9ueW1vdXMgZmQgbWVjaGFuaXNtIHRvIGF2b2lkCj4gdGhlIGRl
cGVuZGVuY2Ugb24gdGhlIGZvcm1hdCBvZiBjYWNoZSBmaWxlLiBXaGVuIGEgZnNjYWNoZSBjYWNo
ZWZpbGUgaXMgb3BlbmVkCj4gZm9yIHRoZSBmaXJzdCB0aW1lLCBhbiBhbm9uX2ZkIGFzc29jaWF0
ZWQgd2l0aCB0aGUgY2FjaGUgZmlsZSBpcyBzZW50IHRvIHRoZQo+IHVzZXIgZGFlbW9uLiBXaXRo
IHRoZSBnaXZlbiBhbm9uX2ZkLCB1c2VyIGRhZW1vbiBjb3VsZCBmZXRjaCBhbmQgd3JpdGUgZGF0
YQo+IGludG8gdGhlIGNhY2hlIGZpbGUgaW4gdGhlIGJhY2tncm91bmQsIGV2ZW4gd2hlbiBrZXJu
ZWwgaGFzIG5vdCB0cmlnZ2VyZWQgdGhlCj4gY2FjaGUgbWlzcy4gQmVzaWRlcywgdGhlIHdyaXRl
KCkgc3lzY2FsbCB0byB0aGUgYW5vbl9mZCB3aWxsIGZpbmFsbHkgY2FsbAo+IGNhY2hlZmlsZXMg
a2VybmVsIG1vZHVsZSwgd2hpY2ggd2lsbCB3cml0ZSBkYXRhIHRvIGNhY2hlIGZpbGUgaW4gdGhl
IGxhdGVzdAo+IGZvcm1hdCBvZiBjYWNoZSBmaWxlLgo+IAo+IDEuIGNhY2hlIG1pc3MKPiBXaGVu
IGNhY2hlIG1pc3MsIGNhY2hlZmlsZXMga2VybmVsIG1vZHVsZSB3aWxsIG5vdGlmeSB1c2VyIGRh
ZW1vbiB3aXRoIHRoZQo+IGFub25fZmQsIGFsb25nIHdpdGggdGhlIHJlcXVlc3RlZCBmaWxlIHJh
bmdlLiBXaGVuIG5vdGlmaWVkLCB1c2VyIGRhZW1vbgo+IG5lZWRzIHRvIGZldGNoIGRhdGEgb2Yg
dGhlIHJlcXVlc3RlZCBmaWxlIHJhbmdlLCBhbmQgdGhlbiB3cml0ZSB0aGUgZmV0Y2hlZAo+IGRh
dGEgaW50byBjYWNoZSBmaWxlIHdpdGggdGhlIGdpdmVuIGFub255bW91cyBmZC4gV2hlbiBmaW5p
c2hlZCBwcm9jZXNzaW5nCj4gdGhlIHJlcXVlc3QsIHVzZXIgZGFlbW9uIG5lZWRzIHRvIG5vdGlm
eSB0aGUga2VybmVsLgo+IAo+IEFmdGVyIG5vdGlmeWluZyB0aGUgdXNlciBkYWVtb24sIHRoZSBr
ZXJuZWwgcmVhZCByb3V0aW5lIHdpbGwgaGFuZyB0aGVyZSwKPiB1bnRpbCB0aGUgcmVxdWVzdCBp
cyBoYW5kbGVkIGJ5IHVzZXIgZGFlbW9uLiBXaGVuIGl0J3MgYXdha2VuIGJ5IHRoZQo+IG5vdGlm
aWNhdGlvbiBmcm9tIHVzZXIgZGFlbW9uLCBpLmUuIHRoZSBjb3JyZXNwb25kaW5nIGhvbGUgaGFz
IGJlZW4gZmlsbGVkCj4gYnkgdGhlIHVzZXIgZGFlbW9uLCBpdCB3aWxsIHJldHJ5IHRvIHJlYWQg
ZnJvbSB0aGUgc2FtZSBmaWxlIHJhbmdlLgo+IAo+IDIuIGNhY2hlIGhpdAo+IE9uY2UgZGF0YSBp
cyBhbHJlYWR5IHJlYWR5IGluIGNhY2hlIGZpbGUsIG5ldGZzIHdpbGwgcmVhZCBmcm9tIGNhY2hl
Cj4gZmlsZSBkaXJlY3RseS4KPiAKPiAKPiBbQWR2YW50YWdlIG9mIGZzY2FjaGUtYmFzZWQgb24t
ZGVtYW5kIHJlYWRdCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
IDEuIEFzeW5jaHJvbm91cyBwcmVmZXRjaAo+IEluIGN1cnJlbnQgbWVjaGFuaXNtLCBmc2NhY2hl
IGlzIHJlc3BvbnNpYmxlIGZvciBjYWNoZSBzdGF0ZSBtYW5hZ2VtZW50LAo+IHdoaWxlIHRoZSBk
YXRhIHBsYW5lIChmZXRjaGluZyBkYXRhIGZyb20gbG9jYWwvcmVtb3RlIG9uIGNhY2hlIG1pc3Mp
IGlzCj4gZG9uZSBvbiB0aGUgdXNlciBkYWVtb24gc2lkZSBldmVuIHdpdGhvdXQgYW55IGZpbGUg
c3lzdGVtIHJlcXVlc3QgZHJpdmVuLgo+IEluIGFkZGl0aW9uLCBpZiBjYWNoZWQgZGF0YSBoYXMg
YWxyZWFkeSBiZWVuIGF2YWlsYWJsZSBsb2NhbGx5LCBmc2NhY2hlCj4gd2lsbCB1c2UgaXQgaW5z
dGVhZCBvZiB0cmFwcGluZyB0byB1c2VyIHNwYWNlIGFueW1vcmUuCj4gCj4gVGhlcmVmb3JlLCBk
aWZmZXJlbnQgZnJvbSBldmVudC1kcml2ZW4gYXBwcm9hY2hlcywgdGhlIGZzY2FjaGUgb24tZGVt
YW5kCj4gdXNlciBkYWVtb24gY291bGQgYWxzbyBmZXRjaCBkYXRhIChmcm9tIHJlbW90ZSkgYXN5
bmNocm9ub3VzbHkgaW4gdGhlCj4gYmFja2dyb3VuZCBqdXN0IGxpa2UgbW9zdCBtdWx0aS10aHJl
YWRlZCBIVFRQIGRvd25sb2FkZXJzLgo+IAo+IDIuIEZsZXhpYmxlIHJlcXVlc3QgYW1wbGlmaWNh
dGlvbgo+IFNpbmNlIHRoZSBkYXRhIHBsYW5lIGNhbiBiZSBpbmRlcGVuZGVudGx5IGNvbnRyb2xs
ZWQgYnkgdGhlIHVzZXIgZGFlbW9uLAo+IHRoZSB1c2VyIGRhZW1vbiBjYW4gYWxzbyBmZXRjaCBt
b3JlIGRhdGEgZnJvbSByZW1vdGUgdGhhbiB0aGF0IHRoZSBmaWxlCj4gc3lzdGVtIGFjdHVhbGx5
IHJlcXVlc3RzIGZvciBzbWFsbCBJL08gc2l6ZXMuIFRoZW4sIGZldGNoZWQgZGF0YSBpbiBidWxr
Cj4gd2lsbCBiZSBhdmFpbGFibGUgYXQgb25jZSBhbmQgZnNjYWNoZSB3b24ndCBiZSB0cmFwcGVk
IGludG8gdGhlIHVzZXIKPiBkYWVtb24gYWdhaW4uCj4gCj4gMy4gU3VwcG9ydCBtYXNzaXZlIGJs
b2JzCj4gVGhpcyBtZWNoYW5pc20gY2FuIG5hdHVyYWxseSBzdXBwb3J0IGEgbGFyZ2UgYW1vdW50
IG9mIGJhY2tpbmcgZmlsZXMsCj4gYW5kIHRodXMgY2FuIGJlbmVmaXQgdGhlIGRlbnNlbHkgZW1w
bG95ZWQgc2NlbmFyaW9zLiBJbiBvdXIgdXNlIGNhc2VzLAo+IG9uZSBjb250YWluZXIgaW1hZ2Ug
Y2FuIGJlIGZvcm1lZCBvZiBvbmUgYm9vdHN0cmFwIChyZXF1aXJlZCkgYW5kCj4gbXVsdGlwbGUg
Y2h1bmstZGVkdXBsaWNhdGVkIGRhdGEgYmxvYnMgKG9wdGlvbmFsKS4KPiAKPiBGb3IgZXhhbXBs
ZSwgb25lIGNvbnRhaW5lciBpbWFnZSBmb3Igbm9kZS5qcyB3aWxsIGNvcnJlc3BvbmQgdG8gfjIw
Cj4gZmlsZXMgaW4gdG90YWwuIEluIGRlbnNlbHkgZW1wbG95ZWQgZW52aXJvbm1lbnQsIHRoZXJl
IGNvdWxkIGJlIGh1bmRyZWRzCj4gb2YgY29udGFpbmVycyBhbmQgdGh1cyB0aG91c2FuZHMgb2Yg
YmFja2luZyBmaWxlcyBvbiBvbmUgbWFjaGluZS4KPiAKPiAKPiAKPiAKPiBKZWZmbGUgWHUgKDIx
KToKPiAgICBjYWNoZWZpbGVzOiBleHRyYWN0IHdyaXRlIHJvdXRpbmUKPiAgICBjYWNoZWZpbGVz
OiBub3RpZnkgdXNlciBkYWVtb24gd2hlbiBsb29raW5nIHVwIGNvb2tpZQo+ICAgIGNhY2hlZmls
ZXM6IHVuYmluZCBjYWNoZWZpbGVzIGdyYWNlZnVsbHkgaW4gb24tZGVtYW5kIG1vZGUKPiAgICBj
YWNoZWZpbGVzOiBub3RpZnkgdXNlciBkYWVtb24gd2hlbiB3aXRoZHJhd2luZyBjb29raWUKPiAg
ICBjYWNoZWZpbGVzOiBpbXBsZW1lbnQgb24tZGVtYW5kIHJlYWQKPiAgICBjYWNoZWZpbGVzOiBl
bmFibGUgb24tZGVtYW5kIHJlYWQgbW9kZQo+ICAgIGNhY2hlZmlsZXM6IGFkZCB0cmFjZXBvaW50
cyBmb3Igb24tZGVtYW5kIHJlYWQgbW9kZQo+ICAgIGNhY2hlZmlsZXM6IGRvY3VtZW50IG9uLWRl
bWFuZCByZWFkIG1vZGUKPiAgICBlcm9mczogbWFrZSBlcm9mc19tYXBfYmxvY2tzKCkgZ2VuZXJh
bGx5IGF2YWlsYWJsZQo+ICAgIGVyb2ZzOiBhZGQgZnNjYWNoZSBtb2RlIGNoZWNrIGhlbHBlcgo+
ICAgIGVyb2ZzOiByZWdpc3RlciBmc2NhY2hlIHZvbHVtZQo+ICAgIGVyb2ZzOiBhZGQgZnNjYWNo
ZSBjb250ZXh0IGhlbHBlciBmdW5jdGlvbnMKPiAgICBlcm9mczogYWRkIGFub255bW91cyBpbm9k
ZSBjYWNoaW5nIG1ldGFkYXRhIGZvciBkYXRhIGJsb2JzCj4gICAgZXJvZnM6IGFkZCBlcm9mc19m
c2NhY2hlX3JlYWRfZm9saW9zKCkgaGVscGVyCj4gICAgZXJvZnM6IHJlZ2lzdGVyIGZzY2FjaGUg
Y29udGV4dCBmb3IgcHJpbWFyeSBkYXRhIGJsb2IKPiAgICBlcm9mczogcmVnaXN0ZXIgZnNjYWNo
ZSBjb250ZXh0IGZvciBleHRyYSBkYXRhIGJsb2JzCj4gICAgZXJvZnM6IGltcGxlbWVudCBmc2Nh
Y2hlLWJhc2VkIG1ldGFkYXRhIHJlYWQKPiAgICBlcm9mczogaW1wbGVtZW50IGZzY2FjaGUtYmFz
ZWQgZGF0YSByZWFkIGZvciBub24taW5saW5lIGxheW91dAo+ICAgIGVyb2ZzOiBpbXBsZW1lbnQg
ZnNjYWNoZS1iYXNlZCBkYXRhIHJlYWQgZm9yIGlubGluZSBsYXlvdXQKPiAgICBlcm9mczogaW1w
bGVtZW50IGZzY2FjaGUtYmFzZWQgZGF0YSByZWFkYWhlYWQKPiAgICBlcm9mczogYWRkICdmc2lk
JyBtb3VudCBvcHRpb24KPiAKPiAgIC4uLi9maWxlc3lzdGVtcy9jYWNoaW5nL2NhY2hlZmlsZXMu
cnN0ICAgICAgICB8IDE3MCArKysrKysKPiAgIGZzL2NhY2hlZmlsZXMvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMSArCj4gICBmcy9jYWNoZWZpbGVzL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICAgZnMvY2FjaGVmaWxlcy9kYWVtb24uYyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTE2ICsrKy0KPiAgIGZzL2NhY2hlZmlsZXMvaW50ZXJmYWNl
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gICBmcy9jYWNoZWZpbGVzL2ludGVybmFs
LmggICAgICAgICAgICAgICAgICAgICAgfCAgNzQgKysrCj4gICBmcy9jYWNoZWZpbGVzL2lvLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNzYgKystCj4gICBmcy9jYWNoZWZpbGVzL25h
bWVpLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKy0KPiAgIGZzL2NhY2hlZmlsZXMv
b25kZW1hbmQuYyAgICAgICAgICAgICAgICAgICAgICB8IDQ5NiArKysrKysrKysrKysrKysrKysK
PiAgIGZzL2Vyb2ZzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCAr
Cj4gICBmcy9lcm9mcy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEg
Kwo+ICAgZnMvZXJvZnMvZGF0YS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI2
ICstCj4gICBmcy9lcm9mcy9mc2NhY2hlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
NjUgKysrKysrKysrKysrKwo+ICAgZnMvZXJvZnMvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA0ICsKPiAgIGZzL2Vyb2ZzL2ludGVybmFsLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0OSArKwo+ICAgZnMvZXJvZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTA1ICsrKy0KPiAgIGZzL2Vyb2ZzL3N5c2ZzLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICAgaW5jbHVkZS9saW51eC9mc2NhY2hlLmggICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGluY2x1ZGUvbGludXgvbmV0ZnMuaCAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gICBpbmNsdWRlL3RyYWNlL2V2ZW50cy9jYWNo
ZWZpbGVzLmggICAgICAgICAgICAgfCAxNzYgKysrKysrKwo+ICAgaW5jbHVkZS91YXBpL2xpbnV4
L2NhY2hlZmlsZXMuaCAgICAgICAgICAgICAgIHwgIDY4ICsrKwo+ICAgMjEgZmlsZXMgY2hhbmdl
ZCwgMTY5NCBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBmcy9jYWNoZWZpbGVzL29uZGVtYW5kLmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBmcy9l
cm9mcy9mc2NhY2hlLmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvbGludXgv
Y2FjaGVmaWxlcy5oCj4gCkhpIEplZmZsZSAmIFhpYW5nLAoKVGhhbmtzIGZvciBjb21pbmcgdXAg
d2l0aCBzdWNoIGFuIGlubm92YXRpdmUgc29sdXRpb24uIFdlIGludGVyZXN0ZWQgaW4KdGhpcyBh
bmQgd2FudCB0byBkZXBsb3kgaXQgaW4gb3VyIHN5c3RlbS4gU28gd2UgaGF2ZSBwZXJmb3JtZWQg
dGhlIHRlc3RzCmJ5IHVzZXIgZ3VpZGUgYW5kIGRpZCBzb21lIGVycm9yIGluamVjdGlvbiB0ZXN0
cyB1c2luZyBVc2VyIERhZW1vbiBEZW1vCm9mZmVyZWQgYnkgSmVmZmxlLiBIb3BlIGl0IGNhbiBi
ZSBhbiB1cHN0cmVhbSBmZWF0dXJlLgoKVGhhbmtzLApKaWEKClRlc3RlZC1ieTogSmlhIFpodSA8
emh1amlhLnpqQGJ5dGVkYW5jZS5jb20+CgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApM
aW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

