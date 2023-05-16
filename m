Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03F705721
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 May 2023 21:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684265538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fHc4StOajgKBdkS2H4RIYOQEEAk/3JxafafrPOTGxec=;
	b=RVycTtWhZQaqBxAIZrBvSPNRFLf6XQzIrM4PZDs+6z2cb9UD+hrc3vWF2ZT6rosUmoWFAd
	zrOddpr78QxxgEDdD9pW+Hl9FI3cazvaQVLC3uUOwAFid/qeA2l98tqEa6ZltVU0uCezp1
	TgKpqqfbidOA2NpsOQ1tl+XR2sfQM1c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-avirNdkrOgaKFGsmWcP-7A-1; Tue, 16 May 2023 15:32:15 -0400
X-MC-Unique: avirNdkrOgaKFGsmWcP-7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFDFB3C00088;
	Tue, 16 May 2023 19:32:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B60DD1121314;
	Tue, 16 May 2023 19:32:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7205E19465B1;
	Tue, 16 May 2023 19:32:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A408F19465A3 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 16 May 2023 19:32:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E11D4492B01; Tue, 16 May 2023 19:32:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D92CC492B00
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 19:32:00 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC66785A588
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 19:32:00 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-hi7h1-IgMZuDBDnBB4iMNw-1; Tue, 16 May 2023 15:28:56 -0400
X-MC-Unique: hi7h1-IgMZuDBDnBB4iMNw-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-25014b171a4so38133a91.1
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 12:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684265334; x=1686857334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYmucfjpnAVSg8OqVdBBlDfXxKfZQdV3kdH7yQdtIZc=;
 b=M/kunzQOTZUMTfaA4BH0evew7tM/3kq3EkhDcuXistTzxqrbG7rcDtfCbsEyxkVEL4
 ixF34NlSjvNGvrGXzEFHHJEfWCAMQQDccOY/BCUtsyjS3jo2SXw1jqm6AfiTN/xzYhgz
 /lluqyYB9NAd2oeFKs5Nlxgl7bdVYOMPWcE8M1xXpIKlhuwX6qYK6kD9R/0tAPLkU+4T
 6c/90v5bfpxJi6ZhPDAbtpovJ31mQa+3i0BdsRbWLWdHuMnAUPVkgZezs6XBYcA5iV7c
 /GdVME1yPLTAtFkMosciOyAmz0tGcuW/F3WohblLUXjVNaApPQMyYXc3dFBOgmk0HplK
 /ygA==
X-Gm-Message-State: AC+VfDwxfPmkohewemSzpx5MGd7zXHwT8Ctrccc2WPuE9hiC1l2E5gXl
 b5CYTrqZzTBov+s3Gig7fN2/acMsGBJafzuTK+aBRGTpZaxGw//6qOBHZiWt2jJGaqJ1vvJ0YPv
 e0k8/jPIDLPmVoNRR45z4k70PBU+URSI89hZTZkqYWt5ff/JZ
X-Received: by 2002:a17:90b:33c7:b0:250:69c7:a95e with SMTP id
 lk7-20020a17090b33c700b0025069c7a95emr31056914pjb.48.1684265334458; 
 Tue, 16 May 2023 12:28:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ560AMr/zL3GYG9F5BUX5SUUiepblXLTbu7Ntnw4Qdxg3GHdcGBO4Mz6NonG/zSmGI3irqD6OmgUYCJA2iA5Cw=
X-Received: by 2002:a17:90b:33c7:b0:250:69c7:a95e with SMTP id
 lk7-20020a17090b33c700b0025069c7a95emr31056904pjb.48.1684265334155; Tue, 16
 May 2023 12:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
In-Reply-To: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 16 May 2023 15:28:17 -0400
Message-ID: <CALF+zO=1oASFeb5WOezeZm_fbCuw=L8AL-n-mbCt8A==ZMAy3Q@mail.gmail.com>
To: Chris Chilvers <chilversc@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [BUG] fscache writing but not reading
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
Cc: Benjamin Maynard <benmaynard@google.com>, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, brennandoyle@google.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgMTE6NDLigK9BTSBDaHJpcyBDaGlsdmVycyA8Y2hpbHZl
cnNjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGlsZSB0ZXN0aW5nIHRoZSBmc2NhY2hlIHBlcmZv
cm1hbmNlIGZpeGVzIFsxXSB0aGF0IHdlcmUgbWVyZ2VkIGludG8gNi40LXJjMQo+IGl0IGFwcGVh
cnMgdGhhdCB0aGUgY2FjaGluZyBubyBsb25nZXIgd29ya3MuIFRoZSBjbGllbnQgd2lsbCB3cml0
ZSB0byB0aGUgY2FjaGUKPiBidXQgbmV2ZXIgcmVhZHMuCj4KVGhhbmtzIGZvciB0aGUgcmVwb3J0
LgoKSWYgeW91IHJlYm9vdCBkbyB5b3Ugc2VlIHJlYWRzIGZyb20gdGhlIGNhY2hlPwoKWW91IGNh
biBjaGVjayBpZiB0aGUgY2FjaGUgaXMgYmVpbmcgcmVhZCBmcm9tIGJ5IGxvb2tpbmcgaW4KL3By
b2MvZnMvZnNjYWNoZS9zdGF0cwphdCB0aGUgIklPIiBsaW5lOgojIGdyZXAgSU8gL3Byb2MvZnMv
ZnNjYWNoZS9zdGF0cwpJTyAgICAgOiByZD04MDAzMCB3cj0wCgpZb3UgbWlnaHQgY29uc2lkZXIg
c2F2aW5nIHRoYXQgZmlsZSBiZWZvcmUgeW91ciB0ZXN0LCB0aGVuIGFub3RoZXIgY29weSBhZnRl
ciwKYW5kIGRvaW5nIGEgZGlmZjoKIyBkaWZmIC11IC90bXAvZnNjYWNoZXN0YXRzLjEgL3RtcC9m
c2NhY2hlc3RhdHMuMgotLS0gL3RtcC9mc2NhY2hlc3RhdHMuMSAyMDIzLTA1LTE2IDE0OjQ4OjQz
LjEyNjE1ODQwMyAtMDQwMAorKysgL3RtcC9mc2NhY2hlc3RhdHMuMiAyMDIzLTA1LTE2IDE0OjU0
OjA1LjQyMTQwMjcwMiAtMDQwMApAQCAtMSwxNCArMSwxNCBAQAogRlMtQ2FjaGUgc3RhdGlzdGlj
cwotQ29va2llczogbj0wIHY9MSB2Y29sPTAgdm9vbT0wCi1BY3F1aXJlOiBuPTAgb2s9MCBvb209
MAotTFJVICAgIDogbj0wIGV4cD0wIHJtdj0wIGRycD0wIGF0PTAKK0Nvb2tpZXM6IG49NSB2PTEg
dmNvbD0wIHZvb209MAorQWNxdWlyZTogbj01IG9rPTUgb29tPTAKK0xSVSAgICA6IG49MCBleHA9
NSBybXY9MCBkcnA9MCBhdD0wCiBJbnZhbHMgOiBuPTAKLVVwZGF0ZXM6IG49MCByc3o9MCByc249
MAorVXBkYXRlczogbj01IHJzej0wIHJzbj0wCiBSZWxpbnFzOiBuPTAgcnRyPTAgZHJvcD0wCiBO
b1NwYWNlOiBud3I9MCBuY3I9MCBjdWxsPTYKLUlPICAgICA6IHJkPTAgd3I9MAotUmRIZWxwIDog
UkE9MCBSUD0wIFdCPTAgV0JaPTAgcnI9MCBzcj0wCitJTyAgICAgOiByZD00MDAxNSB3cj0wCitS
ZEhlbHAgOiBSQT00MDAxNSBSUD0wIFdCPTAgV0JaPTAgcnI9MCBzcj0wCiBSZEhlbHAgOiBaUj0w
IHNoPTAgc2s9MAogUmRIZWxwIDogREw9MCBkcz0wIGRmPTAgZGk9MAotUmRIZWxwIDogUkQ9MCBy
cz0wIHJmPTAKK1JkSGVscCA6IFJEPTQwMDE1IHJzPTQwMDE1IHJmPTAKIFJkSGVscCA6IFdSPTAg
d3M9MCB3Zj0wCgoKPiBJIHN1c3BlY3QgdGhpcyBpcyByZWxhdGVkIHRvIGtub3duIGlzc3VlICMx
LiBIb3dldmVyLCBJIHRlc3RlZCB0aGUgY2xpZW50Cj4gd2l0aCByc2l6ZSBsZXNzIHRoYW4sIGVx
dWFsIHRvLCBhbmQgZ3JlYXRlciB0aGFuIHJlYWRhaGVhZCwgYW5kIGluIGFsbCBjYXNlcwo+IEkg
c2VlIHRoZSBpc3N1ZS4KPgo+IElmIEkgYXBwbHkgYm90aCB0aGUgcGF0Y2hlcyBbMl0sIFszXSBm
cm9tIHRoZSBrbm93biBpc3N1ZXMgdG8gNi40LXJjMSB0aGVuIHRoZQo+IGNhY2hlIHdvcmtzIGFz
IGV4cGVjdGVkLiBJIHN1c3BlY3Qgb25seSBwYXRjaCBbMl0gaXMgcmVxdWlyZWQgYnV0IGhhdmUg
bm90Cj4gdGVzdGVkIHBhdGNoIFsyXSB3aXRob3V0IFszXS4KPgpBZ3JlZSBpdCdzIGxpa2VseSBv
bmx5IHRoZSBwYXRjaGVzIGZyb20gaXNzdWUgIzEgYXJlIG5lZWRlZC4KTGV0IG1lIHBpbmcgZGhv
d2VsbHMgYW5kIHdpbGx5IG9uIHRoYXQgdGhyZWFkIGZvciBpc3N1ZSAjMSBhcyBpdCBsb29rcwpz
dGFsbGVkLgoKCj4gVGVzdGluZwo+ID09PT09PT0KPiBGb3IgdGhlIHRlc3QgSSB3YXMganVzdCB1
c2luZyBkZCB0byByZWFkIDMwMCB4IDFnYiBmaWxlcyBmcm9tIGFuIE5GUwo+IHNoYXJlIHRvIGZp
bGwgdGhlIGNhY2hlLCB0aGVuIHJlcGVhdGluZyB0aGUgcmVhZC4KPgpDYW4geW91IHNoYXJlOgox
LiBORlMgc2VydmVyIHlvdSdyZSB1c2luZyAoaXMgaXQgbG9jYWxob3N0IG9yIHNvbWV0aGluZyBl
bHNlKQoyLiBORlMgdmVyc2lvbgoKPiBJbiB0aGUgZmlyc3QgdGVzdCBydW4sIC92YXIvY2FjaGUv
ZnNjYWNoZSBzdGVhZGlseSBmaWxsZWQgdW50aWwgcmVhY2hpbmcKPiAzMDAgR0IuIFRoZSByZWFk
IEkvTyB3YXMgbGVzcyB0aGFuIDEgTUIvcywgYW5kIHRoZSB3cml0ZSBzcGVlZCB3YXMgZmFpcmx5
Cj4gY29uc3RhbnQgMjcwIE1CL3MuCj4KPiBJbiB0aGUgc2Vjb25kIHJ1biwgL3Zhci9jYWNoZS9m
c2NhY2hlIHJlbWFpbmVkIGF0IDMwMCBHQiwgc28gbm8gbmV3IGRhdGEgd2FzCj4gYmVpbmcgd3Jp
dHRlbi4gSG93ZXZlciwgdGhlIHJlYWQgSS9PIHJlbWFpbmVkIGF0IGxlc3MgdGhhbiAxIE1CL3Mg
YW5kIHRoZSB3cml0ZQo+IHJhdGUgYXQgMjcwIE1CL3MuCj4KPiAgICAgL3Zhci9jYWNoZS9mc2Nh
Y2hlCj4gICAgICAgICAgICAgICAgIHwgMXN0IHJ1biAgICAgfCAybmQgcnVuCj4gICAgIGRpc2sg
dXNhZ2UgIHwgMCAtPiAzMDAgR0IgfCAzMDAgR0IKPiAgICAgcmVhZCBzcGVlZCAgfCA8IDEgTUIv
cyAgICB8IDwgMSBNQi9zCj4gICAgIHdyaXRlIHNwZWVkIHwgMjcwIE1CL3MgICAgfCAyNzAgTUIv
cwo+Cj4gVGhpcyBzZWVtcyB0byBpbXBseSB0aGF0IHRoZSBhbHJlYWR5IGNhY2hlZCBkYXRhIHdh
cyBiZWluZyByZWFkIGZyb20gdGhlIHNvdXJjZQo+IHNlcnZlciBhbmQgcmUtd3JpdHRlbiB0byB0
aGUgY2FjaGUuCj4KCkluIGFkZGl0aW9uIHRvIGNoZWNraW5nIHRoZSBhYm92ZSBmb3IgdGhlIHJl
YWRzIGZyb20gdGhlIGNhY2hlLCB5b3UgY2FuIGFsc28Kc2VlIHdoZXRoZXIgTkZTIHJlYWRzIGFy
ZSBnb2luZyBvdmVyIHRoZSB3aXJlIHByZXR0eSBlYXNpbHkgd2l0aCBhIHNpbWlsYXIKdGVjaG5p
cXVlLgoKQ29weSAvcHJvYy9zZWxmL21vdW5zdGF0cyB0byBhIGZpbGUgYmVmb3JlIHlvdXIgdGVz
dCwgdGhlbiBtYWtlIGEgc2Vjb25kIGNvcHkKYWZ0ZXIgdGhlIHRlc3QsIHRoZW4gcnVuIG1vdW50
c3RhdHMgYXMgZm9sbG93czoKbW91bnRzdGF0cyAtUyAvdG1wL21vdW50c3RhdHMuMSAtZiAvdG1w
L21vdW50c3RhdHMuMgoKCgo+IEtub3duIElzc3Vlcwo+ID09PT09PT09PT09PQo+IDEuIFVuaXQg
dGVzdCBzZXR0aW5nIHJzaXplIDwgcmVhZGFoZWFkIGRvZXMgbm90IHByb3Blcmx5IHJlYWQgZnJv
bQo+IGZzY2FjaGUgYnV0IHJlLXJlYWRzIGRhdGEgZnJvbSB0aGUgTkZTIHNlcnZlcgo+ICogVGhp
cyB3aWxsIGJlIGZpeGVkIHdpdGggYW5vdGhlciBkaG93ZWxscyBwYXRjaCBbMl06Cj4gICAiW1BB
VENIIHY2IDIvMl0gbW0sIG5ldGZzLCBmc2NhY2hlOiBTdG9wIHJlYWQgb3B0aW1pc2F0aW9uIHdo
ZW4KPiBmb2xpbyByZW1vdmVkIGZyb20gcGFnZWNhY2hlIgo+Cj4gMi4gIkNhY2hlIHZvbHVtZSBr
ZXkgYWxyZWFkeSBpbiB1c2UiIGFmdGVyIHhmc3Rlc3QgcnVucyBpbnZvbHZpbmcKPiBtdWx0aXBs
ZSBtb3VudHMKPiAqIFNpbXBsZSByZXByb2R1Y2VyIHJlcXVpcmVzIGp1c3QgdHdvIG1vdW50cyBh
cyBmb2xsb3dzOgo+ICBtb3VudCAtb3ZlcnM9NC4xLGZzYyxub3NoYXJlY2FjaGUgLW8KPiBjb250
ZXh0PXN5c3RlbV91Om9iamVjdF9yOnJvb3RfdDpzMCAgbmZzLXNlcnZlcjovZXhwMSAvbW50MQo+
ICBtb3VudCAtb3ZlcnM9NC4xLGZzYyxub3NoYXJlY2FjaGUgLW8KPiBjb250ZXh0PXN5c3RlbV91
Om9iamVjdF9yOnJvb3RfdDpzMCAgbmZzLXNlcnZlcjovZXhwMiAvbW50Mgo+ICogVGhpcyBzaG91
bGQgYmUgZml4ZWQgd2l0aCBkaG93ZWxscyBwYXRjaCBbM106Cj4gICAiW1BBVENIIHY1XSB2ZnMs
IHNlY3VyaXR5OiBGaXggYXV0b21vdW50IHN1cGVyYmxvY2sgTFNNIGluaXQKPiBwcm9ibGVtLCBw
cmV2ZW50aW5nIE5GUyBzYiBzaGFyaW5nIgo+Cj4gUmVmZXJlbmNlcwo+ID09PT09PT09PT0KPgo+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1uZnMvMjAyMzAyMjAxMzQzMDguMTE5
MzIxOS0xLWR3eXNvY2hhQHJlZGhhdC5jb20vCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW5mcy8yMDIzMDIxNjE1MDcwMS4zNjU0ODk0LTEtZGhvd2VsbHNAcmVkaGF0LmNvbS9U
LyNtZjM4MDdmYTY4ZmI2ZDQ5NWI4N2RkZTBkNzZiNTIzNzgzM2EwY2M4MQo+IFszXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1rZXJuZWwvMjE3NTk1LjE2NjIwMzM3NzVAd2FydGhvZy5w
cm9jeW9uLm9yZy51ay8KPgo+IC0tCj4gTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKPiBMaW51
eC1jYWNoZWZzQHJlZGhhdC5jb20KPiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMKPgoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QK
TGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

